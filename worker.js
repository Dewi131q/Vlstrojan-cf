// VLESS Cloudflare Worker Proxy (Open UUID - Semua UUID diterima)

addEventListener('fetch', event => {
  event.respondWith(handleRequest(event.request));
});

async function handleRequest(request) {
  if (request.headers.get('Upgrade') === 'websocket') {
    const [client, server] = Object.values(new WebSocketPair());
    vlessOverWS(server);
    return new Response(null, { status: 101, webSocket: client });
  } else {
    return new Response('VLESS Cloudflare Worker Proxy\n', { status: 200 });
  }
}

async function vlessOverWS(ws) {
  ws.accept();

  let handshake = new Uint8Array();
  let connected = false;

  ws.addEventListener('message', async event => {
    if (connected) return;
    let data = new Uint8Array(event.data);
    handshake = concatUint8Array(handshake, data);

    if (handshake.length < 24) return; // Minimal handshake VLESS

    // Tidak ada validasi UUID, semua UUID diterima!

    // Parse address
    const addrType = handshake[21];
    let addr = "";
    let offset = 22;
    if (addrType === 1) { // IPv4
      addr = [...handshake.slice(offset, offset+4)].join(".");
      offset += 4;
    } else if (addrType === 2) { // domain
      const len = handshake[offset];
      offset += 1;
      addr = new TextDecoder().decode(handshake.slice(offset, offset+len));
      offset += len;
    } else if (addrType === 3) { // IPv6
      addr = [...Array(8).keys()].map(i =>
        handshake[offset+i*2].toString(16).padStart(2,"0") +
        handshake[offset+i*2+1].toString(16).padStart(2,"0")
      ).join(":");
      offset += 16;
    } else {
      ws.send("invalid addrType");
      ws.close();
      return;
    }
    const port = (handshake[offset]<<8) + handshake[offset+1];
    offset += 2;

    // Connect to target (NOTE: Worker free hanya support fetch ke port 80/443)
    let response, targetStream;
    try {
      const url = `https://${addr}:${port}`;
      response = await fetch(url);
      targetStream = response.body.getReader();
    } catch {
      ws.send("connect failed");
      ws.close();
      return;
    }

    // Relay: (hanya satu arah demo, sebenarnya perlu duplex stream)
    ws.send("connected demo (fetch only)");

    // Demo: kirim data dari target (HTTP) ke client
    (async () => {
      while (true) {
        const {done, value} = await targetStream.read();
        if (done) break;
        ws.send(value);
      }
      ws.close();
    })();

    connected = true;
  });
}

function concatUint8Array(a, b) {
  let out = new Uint8Array(a.length + b.length);
  out.set(a, 0); out.set(b, a.length);
  return out;
}

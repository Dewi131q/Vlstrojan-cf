addEventListener('fetch', event => {
  event.respondWith(handleRequest(event.request));
});

async function handleRequest(request) {
  if (request.headers.get('Upgrade') === 'websocket') {
    const [client, server] = Object.values(new WebSocketPair());
    handleWebSocket(server);
    return new Response(null, { status: 101, webSocket: client });
  } else {
    return new Response('VLESS/Trojan Cloudflare Worker Proxy\n', { status: 200 });
  }
}

async function handleWebSocket(webSocket) {
  webSocket.accept();
  // TODO: Implementasi parsing handshake VLESS/Trojan,
  // Validasi UUID, relay ke target, dsb.
  // Bagian ini akan diisi pada step lanjutan.
}

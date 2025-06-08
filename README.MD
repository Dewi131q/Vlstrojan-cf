# VLESS/Trojan Cloudflare Worker Proxy

Proyek ini memungkinkan kamu menjalankan proxy VLESS/Trojan berbasis WebSocket langsung di Cloudflare Workers **tanpa VPS**!

## Fitur
- Endpoint VLESS/Trojan stateless di Cloudflare Workers
- Deployment mudah (cukup copy-paste kode ke Worker)
- Cocok untuk bypass, VPN ringan, anti blokir, penggunaan personal
- Tanpa biaya VPS!

## Cara Deploy

1. **Fork/Clone repo ini** ke akun GitHub kamu.
2. **Salin file `worker.js` ke Cloudflare Worker:**
   - Masuk ke dashboard [Cloudflare Workers](https://dash.cloudflare.com/) → Workers → Create Service
   - Pilih "Quick Edit", paste seluruh isi `worker.js`.
   - Deploy.

3. **Atur domain custom (optional):**
   - Bisa menggunakan subdomain kamu sendiri lewat pengaturan Cloudflare.

## Cara Pakai

1. **Konfigurasi client (V2RayN, v2rayNG, Clash, dsb):**
   - Alamat server: domain Worker kamu (misal: `namamu.workers.dev` atau custom domain)
   - Protokol: VLESS/Trojan over WebSocket
   - UUID/password: (nanti diatur di Worker.js, untuk versi sederhana bisa UUID random)
   - Path WebSocket: default `/`

2. **Generate link VLESS/Trojan** (akan dijelaskan jika sudah implementasi penuh).

## Catatan

- Worker.js ini baru kerangka awal. Untuk versi produksi, perlu implementasi parsing handshake VLESS/Trojan, validasi UUID, dan relay data ke target.
- Penggunaan gratis Cloudflare Worker memiliki batasan (100.000 request/hari, 50ms CPU/request, dsb).

---

## Kontribusi

Silakan open PR/issue jika ingin membantu pengembangan, menambah fitur, atau menemukan bug.

---

## Lisensi

MIT

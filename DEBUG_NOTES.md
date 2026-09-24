# DEBUG NOTES – Modul 02

## Bug 1 – RenderFlex Overflow

**Gejala:** Teks kegiatan terlalu panjang sehingga card mengalami overflow.

**Penyebab:** Widget Text tidak memiliki ruang fleksibel.

**Perbaikan:** Menggunakan Expanded, maxLines, dan TextOverflow.ellipsis sehingga tampilan tetap rapi.

---

## Bug 2 – Grid Tidak Responsif

**Gejala:** Pada ukuran tablet card terlihat terlalu sempit.

**Penyebab:** Grid menggunakan jumlah kolom yang statis.

**Perbaikan:** Menggunakan LayoutBuilder untuk mengubah jumlah kolom menjadi 1, 2, 3, atau 4 sesuai lebar layar.
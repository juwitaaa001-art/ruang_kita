class RoomSession {
  final String studio;
  final String activity;
  final String time;
  final String status;
  final String description;

  RoomSession({
    required this.studio,
    required this.activity,
    required this.time,
    required this.status,
    required this.description,
  });

  static List<RoomSession> data = [
    RoomSession(
      studio: "Studio Foto",
      activity: "Sesi Foto Produk UMKM",
      time: "08.00 - 10.00",
      status: "Berlangsung",
      description: "Pemotretan produk menggunakan lighting profesional.",
    ),
    RoomSession(
      studio: "Studio Audio",
      activity: "Rekaman Podcast Teknologi",
      time: "10.00 - 12.00",
      status: "Akan Datang",
      description: "Rekaman podcast bersama mahasiswa TRPL.",
    ),
    RoomSession(
      studio: "Studio Editing",
      activity: "Editing Video Dokumenter Kampus",
      time: "13.00 - 15.00",
      status: "Berlangsung",
      description: "Mahasiswa mengedit video menggunakan software editing.",
    ),
    RoomSession(
      studio: "Studio Streaming",
      activity: "Live Streaming Seminar Nasional",
      time: "15.00 - 17.00",
      status: "Tersedia",
      description: "Studio siap digunakan untuk siaran langsung.",
    ),
    RoomSession(
      studio: "Studio Foto",
      activity: "Workshop Lighting Profesional",
      time: "09.00 - 11.00",
      status: "Selesai",
      description: "Pelatihan teknik pencahayaan fotografi.",
    ),
    RoomSession(
      studio: "Studio Audio",
      activity: "Mixing Musik Akustik",
      time: "11.00 - 13.00",
      status: "Tersedia",
      description: "Ruangan kosong dan siap digunakan.",
    ),
    RoomSession(
      studio: "Studio Editing",
      activity: "Color Grading Film Pendek Dengan Teknik Sinematik Profesional",
      time: "14.00 - 16.00",
      status: "Akan Datang",
      description: "Deskripsi ini dibuat lebih dari sembilan puluh karakter agar memenuhi syarat pengujian overflow pada tugas Modul 02 Flutter Responsive Layout.",
    ),
    RoomSession(
      studio: "Studio Streaming",
      activity: "Produksi Siaran Kampus",
      time: "16.00 - 18.00",
      status: "Selesai",
      description: "Kegiatan produksi siaran telah selesai dilaksanakan.",
    ),
  ];
}

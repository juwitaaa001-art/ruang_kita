import 'package:flutter/material.dart';

import '../../models/room_session.dart';

class StudioMultimediaPage extends StatefulWidget {
  const StudioMultimediaPage({super.key});

  @override
  State<StudioMultimediaPage> createState() => _StudioMultimediaPageState();
}

class _StudioMultimediaPageState extends State<StudioMultimediaPage> {
  bool darkMode = false;
  String selected = "Semua";

  final List<String> filters = [
    "Semua",
    "Berlangsung",
    "Akan Datang",
    "Selesai",
    "Tersedia",
  ];

  @override
  Widget build(BuildContext context) {
    final data = selected == "Semua"
        ? RoomSession.data
        : RoomSession.data.where((e) => e.status == selected).toList();

    return Theme(
      data: darkMode
          ? ThemeData.dark(useMaterial3: true)
          : ThemeData(
              useMaterial3: true,
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
              scaffoldBackgroundColor: const Color(0xffEDF6F5),
            ),
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            int crossAxis = 1;

            if (constraints.maxWidth >= 1200) {
              crossAxis = 4;
            } else if (constraints.maxWidth >= 840) {
              crossAxis = 3;
            } else if (constraints.maxWidth >= 600) {
              crossAxis = 2;
            }

            return Column(
              children: [
                // ================= HEADER =================
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(28, 42, 28, 28),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xff0F766E), Color(0xff0EA5A8)],
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(28),
                      bottomRight: Radius.circular(28),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: const [
                                Icon(
                                  Icons.hexagon,
                                  color: Colors.white,
                                  size: 22,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  "RuangKita",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 18),
                            Text(
                              "Studio & Multimedia",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 34,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              "Dashboard Ketersediaan Studio",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 17,
                              ),
                            ),
                            SizedBox(height: 18),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: const Text(
                                "M02-0005",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff0F766E),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() => darkMode = !darkMode);
                        },
                        icon: Icon(
                          darkMode ? Icons.light_mode : Icons.dark_mode,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 22),

                // ================= FILTER =================
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  alignment: WrapAlignment.center,
                  children: filters.map((item) {
                    return ChoiceChip(
                      label: Text(item),
                      selected: selected == item,
                      selectedColor: const Color(0xff0F9FA4),
                      labelStyle: TextStyle(
                        color: selected == item ? Colors.white : Colors.black87,
                      ),
                      onSelected: (_) {
                        setState(() => selected = item);
                      },
                    );
                  }).toList(),
                ),

                const SizedBox(height: 22),

                // ================= GRID =================
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 4,
                    ),
                    itemCount: data.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxis,
                      crossAxisSpacing: 18,
                      mainAxisSpacing: 18,
                      childAspectRatio: 1.28,
                    ),
                    itemBuilder: (context, index) {
                      final item = data[index];

                      return InkWell(
                        borderRadius: BorderRadius.circular(22),
                        onTap: () => showDetail(item),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(22),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(.08),
                                blurRadius: 18,
                                offset: const Offset(0, 8),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(18),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 24,
                                      backgroundColor: iconColor(item.studio)
                                          .withOpacity(.15),
                                      child: Icon(
                                        studioIcon(item.studio),
                                        color: iconColor(item.studio),
                                        size: 28,
                                      ),
                                    ),
                                    const Spacer(),
                                    statusBadge(item.status),
                                  ],
                                ),
                                const SizedBox(height: 18),
                                Text(
                                  item.studio,
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  item.activity,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Expanded(
                                  child: Text(
                                    item.description,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Colors.grey.shade700,
                                      height: 1.4,
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.access_time, size: 18),
                                    const SizedBox(width: 6),
                                    Text(
                                      item.time,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  // ================= WIDGET =================

  Widget statusBadge(String status) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: statusColor(status),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        status,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 11,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  IconData studioIcon(String studio) {
    switch (studio) {
      case "Studio Foto":
        return Icons.camera_alt;
      case "Studio Audio":
        return Icons.mic;
      case "Studio Editing":
        return Icons.movie_creation;
      default:
        return Icons.live_tv;
    }
  }

  Color iconColor(String studio) {
    switch (studio) {
      case "Studio Foto":
        return Colors.teal;
      case "Studio Audio":
        return Colors.deepPurple;
      case "Studio Editing":
        return Colors.blue;
      default:
        return Colors.pink;
    }
  }

  Color statusColor(String status) {
    switch (status) {
      case "Berlangsung":
        return Colors.green;
      case "Akan Datang":
        return Colors.orange;
      case "Selesai":
        return Colors.blueGrey;
      default:
        return Colors.blue;
    }
  }

  void showDetail(RoomSession item) {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.studio,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text("Kegiatan : ${item.activity}"),
            Text("Waktu : ${item.time}"),
            const SizedBox(height: 8),
            statusBadge(item.status),
            const SizedBox(height: 16),
            Text(item.description),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Tutup"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

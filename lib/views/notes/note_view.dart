import 'package:aplikasi_5sib1_mobile3/controllers/note_controller.dart';
import 'package:aplikasi_5sib1_mobile3/models/note_model.dart';
import 'package:aplikasi_5sib1_mobile3/views/login_view.dart';
import 'package:aplikasi_5sib1_mobile3/views/notes/create_note_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NoteView extends StatelessWidget {
  const NoteView({super.key});

  @override
  Widget build(BuildContext context) {
    final noteController = NoteController();
    noteController.init();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: const Text("Notes App"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginView(),
                ),
                // Hapus semua route sebelumnya
                (route) => false,
              );
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CreateNoteView(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(15),
        child: Column(
          children: [
            // textfield pencarian
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Cari Notes disini...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Theme.of(context).colorScheme.surfaceContainer,
                contentPadding: EdgeInsets.only(top: 13),
              ),
            ),
            // List Notes
            Expanded(
              child: FutureBuilder<List<NoteModel>>(
                future: noteController.notes,
                builder: (BuildContext context,
                    AsyncSnapshot<List<NoteModel>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text("No Data"));
                  } else {
                    final items = snapshot.data!;
                    return ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final note = items[index];
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            elevation: 4,
                            shadowColor: Colors.black.withAlpha(123),
                            child: ListTile(
                              tileColor: Colors.teal.withAlpha(30),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 6),
                              title: Text(
                                note.noteTitle,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.teal.shade800,
                                ),
                              ),
                              subtitle: Text(
                                note.noteContent,
                                style: TextStyle(
                                  color: Colors.teal.shade600,
                                  fontSize: 13,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              trailing: Text(
                                DateFormat("yMMMd")
                                    .format(DateTime.parse(note.createdAt)),
                                style: TextStyle(
                                  color: Colors.teal.shade600,
                                  fontSize: 13,
                                ),
                              ),
                              onTap: () {
                                // Navigasi ke halaman lihat/update note
                              },
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

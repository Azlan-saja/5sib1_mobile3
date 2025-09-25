import 'package:aplikasi_5sib1_mobile3/controllers/note_controller.dart';
import 'package:flutter/material.dart';

class CreateNoteView extends StatelessWidget {
  const CreateNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    final noteController = NoteController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        title: Text('Create Note'),
        actions: [
          IconButton(
            onPressed: () => noteController.prosesCreateData(context),
            icon: Icon(Icons.check),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: noteController.formKey,
          child: Column(
            children: [
              // 1. Inputan TITLE
              TextFormField(
                validator: (value) => noteController.cekVailadasi(value),
                controller: noteController.titleController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.title),
                  hintText: "Masukkan Title",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.surfaceContainer,
                  contentPadding: EdgeInsets.only(top: 13),
                ),
              ),
              // 2. Inputan CONTENT
              SizedBox(height: 10),
              TextFormField(
                validator: (value) => noteController.cekVailadasi(value),
                controller: noteController.contentController,
                maxLines: 3,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.notes),
                  hintText: "Masukkan Content",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.surfaceContainer,
                  contentPadding: EdgeInsets.only(top: 13),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

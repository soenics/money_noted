import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class NotePage extends StatefulWidget {
  const NotePage({super.key});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  final TextEditingController _controller = TextEditingController();
  List<String> notes = [];

  final _mynoted = Hive.box('notes');

  @override
  void initState() {
    super.initState();
    _readData();
  }

  void _writeData() {
    final newNote = _controller.text.trim();
    if (newNote.isNotEmpty) {
      notes.add(newNote);
      _mynoted.put('note', notes);
      _controller.clear();
      _readData();
    }
  }

void _readData() {
  // Check type of stored value before casting
  var storedValue = _mynoted.get('note');
  if (storedValue is List) {
    setState(() {
      notes = List<String>.from(storedValue);
    });
  } else {
    // Clear corrupt/invalid data
    _mynoted.delete('note');
    setState(() {
      notes = [];
    });
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Note Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter your note',
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _writeData,
              child: const Text('Add Note'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Your Notes:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: notes.isEmpty
                  ? const Center(child: Text('No notes yet.'))
                  : ListView.builder(
                      itemCount: notes.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: const Icon(Icons.note),
                          title: Text(notes[index]),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

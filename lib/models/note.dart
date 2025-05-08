// final String tableNote = 'notes';

// class NoteFields {
//   static final List<String> values = [
//     id, isImportant, number, title, time, description, createTime
//   ];
//   static const String id = 'id';
//   static const String isImportant = 'isImportant';
//   static const String number = 'number';
//   static const String title = 'title';
//   static const String time = 'time';
//   static const String description = 'description';
//   static const String createTime = 'createTime';
// }

// class Note {
//   final int id;
//   final bool isImportant;
//   final int number;
//   final String title;
//   final String time;
//   final String description;
//   final DateTime createTime;


//   Note({
//     required this.id,
//     required this.isImportant,
//     required this.number,
//     required this.title,
//     required this.time,
//     required this.description,
//     required this.createTime,
//   });
//   Note copy({
//     int? id,
//     bool? isImportant,
//     int? number,
//     String? title,
//     String? time,
//     String? description,
//     DateTime? createTime,
//   }) =>
//       Note(
//         id: id ?? this.id,
//         isImportant: isImportant ?? this.isImportant,
//         number: number ?? this.number,
//         title: title ?? this.title,
//         time: time ?? this.time,
//         description: description ?? this.description,
//         createTime: createTime ?? this.createTime,
//       );
//   static Note fromJson(Map<String, Object?> json) => Note(
//         id: json[NoteFields.id] as int,
//         isImportant: (json[NoteFields.isImportant] as int) == 1,
//         number: json[NoteFields.number] as int,
//         title: json[NoteFields.title] as String,
//         time: json[NoteFields.time] as String,
//         description: json[NoteFields.description] as String,
//         createTime: DateTime.parse(json[NoteFields.createTime] as String),
//       );


//   Map<String, dynamic> toJson() {
//     return {
//       NoteFields.id: id,
//       NoteFields.isImportant: isImportant ? 1 : 0,
//       NoteFields.number: number,
//       NoteFields.title: title,
//       NoteFields.time: time,
//       NoteFields.description: description,
//       NoteFields.createTime: createTime.toIso8601String(),
//     };
//   }
// }

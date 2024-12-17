// lib/model.dart

class Item {
  final int userId;
  final int id;
  final String title;
  final String body;

  Item({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  // Método para criar um objeto Item a partir de um mapa JSON
  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      userId: json['userId'],  // Agora inclui 'userId'
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  @override
  String toString() {
    return 'User ID: $userId\nID: $id\nTitle: $title\nBody: $body\n';
  }
}

import 'dart:convert';

import 'package:http/http.dart';

import '../models/user.dart';

class PersonRepository {
  final Client client;

  PersonRepository({
    required this.client,
  });

  Future<List<User>> getUsers() async {
    final response = await client
        .get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      final jsonList = jsonDecode(response.body) as List;

      return jsonList.map((e) => User.fromMap(e)).toList();
    } else {
      throw Exception('erro na requisição');
    }
  }
}

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:unity_test_study/repository/user_repository.dart';

class ClientMock extends Mock implements http.Client {}

void main() {
  final clientMock = ClientMock();

  final repo = PersonRepository(
    client: clientMock,
  );

  test(
    'deve pegar uma lista de person',
    () async {
      when(
        () => clientMock.get(
          Uri.parse('https://jsonplaceholder.typicode.com/users'),
        ),
      ).thenAnswer(
        (_) async => http.Response(
          jsonEncode(
            [
              {
                "id": 1,
                "name": "Leanne Graham",
                "username": "Bret",
                "email": "Sincere@april.biz",
                "address": {
                  "street": "Kulas Light",
                  "suite": "Apt. 556",
                  "city": "Gwenborough",
                  "zipcode": "92998-3874",
                  "geo": {
                    "lat": "-37.3159",
                    "lng": "81.1496",
                  }
                },
                "phone": "1-770-736-8031 x56442",
                "website": "hildegard.org",
                "company": {
                  "name": "Romaguera-Crona",
                  "catchPhrase": "Multi-layered client-server neural-net",
                  "bs": "harness real-time e-markets"
                }
              }
            ],
          ),
          200,
        ),
      );

      final list = await repo.getUsers();

      expect(
        list.isNotEmpty,
        equals(true),
      );
      expect(
        list.first.name,
        equals('Leanne Graham'),
      );
    },
  );
}

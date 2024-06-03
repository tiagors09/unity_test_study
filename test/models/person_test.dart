@Timeout(
  Duration(
    seconds: 60,
  ),
)

// @Tags(['web', 'ios'])

@Skip('Não quero terminar hj')

import 'package:test/test.dart';
import 'package:unity_test_study/models/person.dart';

void main() {
  late Person person = Person(
    name: 'Tiago',
    age: 23,
    height: 1.63,
    weight: 60,
  );

  setUp(() {
    print('inicia teste');
  });

  tearDown(() {
    print('destroi o teste');
  });

  // dá para colocar skip no teste
  test(
    'o imc deve vir 22.58:',
    () {
      expect(person.imc, 22.58);
    },
    tags: 'web',
  );

  group(
    'isLegalAge | ',
    () {
      test(
        'se a idade for maior que 18, então isLegalAge deve ser true',
        () {
          expect(person.isLegalAge, true);
        },
      );

      test(
        'se a idade for igual que 18, então isLegalAge deve ser true',
        () {
          final person = Person(
            name: 'Dude',
            age: 18,
            height: 1.63,
            weight: 60,
          );
          expect(person.isLegalAge, true);
        },
      );
    },
    timeout: Timeout(
      Duration(
        seconds: 50,
      ),
    ),
  );
}

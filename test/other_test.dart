@Skip('pula')

import 'package:test/test.dart';

void main() {
  // initState da suite de teste
  setUpAll(() => print('inicia a suite de teste'));

  // initState do teste
  // executado em todo teste
  setUp(() => print('inicia o teste'));

  test('is worked 1', () => print('is worked 1'));

  test('is worked 2', () => print('is worked 2'));

  // caso de sucesso
  test(
    'is worked 3',
    () {
      final name = 'Jacob';

      expect(
        name,
        allOf(
          [equals('Jacob')],
          isNotNull,
          contains('ac'),
          isA<String>(),
        ),
      );
    },
  );

  // caso de fracasso
  test('unknow test', () {
    expect(() => int.parse('x'), throwsA(isA<Exception>()));
  });

  // caso de fracasso
  test(
    'unknow test',
    () {
      expect(() => int.parse('x'), throwsException);
    },
    timeout: Timeout(
      Duration(
        seconds: 60,
      ),
    ),
  );

  // dispose do teste
  // tambem executado em todo teste
  tearDown(() => print('finaliza o teste'));

  // dispose da suite de teste
  tearDownAll(() => print('finaliza suite de teste'));
}

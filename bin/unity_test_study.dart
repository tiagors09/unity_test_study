import 'package:unity_test_study/models/person.dart';

void main(List<String> arguments) {
  final person = Person(
    name: 'Tiago',
    age: 23,
    height: 1.63,
    weight: 60,
  );

  // teste invalido
  // o sdk já fez isso
  print('A idade tem que ser 23: ${person.age == 23}');

  print('IMC deve vir 22.58: ${person.imc == 22.58}');
  print(person.imc);
}

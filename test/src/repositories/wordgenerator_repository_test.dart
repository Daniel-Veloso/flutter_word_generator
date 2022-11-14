import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:word_generator/src/models/wordgenerator_model.dart';
import 'package:word_generator/src/repositories/wordgenerator_repository.dart';

class DioMock extends Mock implements Dio{}

main(){
  final dio = DioMock();
  final repository = WordGeneratorRepository(dio); 

  test('must bring the object', () async{
    when(() => dio.get(any()))
    .thenAnswer((_) async => Response(
      data: jsonData, 
      requestOptions: RequestOptions(path:' '),
      ),
    );

    final WordGeneratorModel obj = await repository.fetchWordGenerator();
    print(obj.slip?.advice);
  });
}

String jsonData = '''
{"slip": { "id": 197, "advice": "Look people in the eye."}}
''';
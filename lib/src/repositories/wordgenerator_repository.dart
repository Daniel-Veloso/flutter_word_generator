import 'package:dio/dio.dart';
import '../models/wordgenerator_model.dart';
import 'dart:convert';

class WordGeneratorRepository{

  Dio? dio;
  final url = 'https://api.adviceslip.com/advice';

  WordGeneratorRepository([Dio? client]){
    dio = client ?? Dio();
  }

  Future fetchWordGenerator() async{
    final response = await dio!.get(url);
    final Map<String, dynamic> json = jsonDecode(response.data);
    final wordGenerator = WordGeneratorModel.fromJson(json);
    return wordGenerator;
  }
}
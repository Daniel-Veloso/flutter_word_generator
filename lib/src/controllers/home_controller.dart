import 'package:word_generator/src/models/wordgenerator_model.dart';
import 'package:word_generator/src/repositories/wordgenerator_repository.dart';

class HomeController{
  WordGeneratorModel? wordGenerator;
  WordGeneratorRepository? _repository;

  HomeController([WordGeneratorRepository? repository]){
    _repository = repository ?? WordGeneratorRepository(); 
  }

  Future start() async{
    wordGenerator = await _repository!.fetchWordGenerator();
  }
}
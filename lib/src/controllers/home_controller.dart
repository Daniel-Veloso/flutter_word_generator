import 'package:flutter/material.dart';
import 'package:word_generator/src/models/wordgenerator_model.dart';
import 'package:word_generator/src/repositories/wordgenerator_repository.dart';

class HomeController{
  WordGeneratorModel? wordGenerator;
  WordGeneratorRepository? _repository;
  final state = ValueNotifier<HomeState>(HomeState.start);

  HomeController([WordGeneratorRepository? repository]){
    _repository = repository ?? WordGeneratorRepository(); 
  }

  Future start() async{
    state.value = HomeState.loading;
    try {
      wordGenerator = await _repository!.fetchWordGenerator();
      state.value = HomeState.success;
    } catch (e){
      state.value = HomeState.error;
    }
  }
}

enum HomeState{
  start, loading, success, error
}
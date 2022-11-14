import 'package:flutter/material.dart';

import 'controllers/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

    _sucess(){
    return Container(
      child: Center(
        child: Text(controller.wordGenerator!.slip!.advice.toString()),
      ),
    );
  }

  _error(){
    return Center(
      child: ElevatedButton(
        onPressed: (){
          controller.start();
        },
        child: const Text('Try again'),
      ),
    );
  }

  _loading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  _start() {
    return Container();
  }

  stateManagement(HomeState state){
    switch (state) {
      case HomeState.start :
        return _start();
      case HomeState.loading :
        return _loading();
      case HomeState.success :
        return _sucess();
      case HomeState.error :
        return _error();
      default: return _start();
    }
  }

  @override
  void initState() {
    super.initState();
    controller.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Word Generator'),
        actions: [
          IconButton(
            onPressed: (){
              controller.start();
            }, 
            icon: const Icon(Icons.refresh_outlined),
          ),
        ],
      ),
      body: AnimatedBuilder(
        animation: controller.state,
        builder: (context, child) {
          return stateManagement(controller.state.value);
        },
      ),
    );
  }
}

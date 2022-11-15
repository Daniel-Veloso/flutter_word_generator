import 'package:flutter/material.dart';

import 'controllers/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  _sucess() {
    return Container(
      child: Center(
        child: Text(
          controller.wordGenerator!.slip!.advice.toString(),
          textAlign: TextAlign.center,
          style: const TextStyle(fontFamily: 'Lato', fontSize: 28),
        ),
      ),
    );
  }

  _error() {
    return Center(
      child: ElevatedButton(
        onPressed: () {
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

  stateManagement(HomeState state) {
    switch (state) {
      case HomeState.start:
        return _start();
      case HomeState.loading:
        return _loading();
      case HomeState.success:
        return _sucess();
      case HomeState.error:
        return _error();
      default:
        return _start();
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
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              'assets/images/background.png',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 150,
                height: 150,
                child: Image.asset('assets/images/logo.png'),
              ),
              Container(height: 70),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: AnimatedBuilder(
                  animation: controller.state,
                  builder: (context, child) {
                    return stateManagement(controller.state.value);
                  },
                ),
              ),
              Container(height: 80),
              ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: SizedBox(
                  height: 50,
                  width: 180,
                  child: ElevatedButton(
                    onPressed: () {
                      controller.start();
                    }, 
                    child: const Text(
                      'New sentence',
                      style: TextStyle(fontSize: 16),
                    ),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

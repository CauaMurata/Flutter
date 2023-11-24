import 'package:flutter/material.dart';
import 'package:myapp/model/car.dart';

class AddCars extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();
  final TextEditingController _colorController = TextEditingController();

  AddCars({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ADICIONAR CARRO'),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: Colors.blueGrey.shade800,
      ),
      body: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              TextField(
                controller: _nameController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                    labelText: 'Name', hintText: 'Enter Car Name'),
              ),
              TextField(
                controller: _yearController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: 'year', hintText: 'Enter Car Year'),
              ),
              TextField(
                controller: _colorController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    labelText: 'Color', hintText: 'Enter Car Color'),
              ),
              ElevatedButton(
                  onPressed: () {
                    final String name = _nameController.text;
                    final int? year = int.tryParse(_yearController.text);
                    final String color = _colorController.text;

                    final car = Car(name, year!, color);
                    Navigator.pop(context, car);
                  },
                  child: const Icon(Icons.save)),
            ],
          )),
    );
  }
}

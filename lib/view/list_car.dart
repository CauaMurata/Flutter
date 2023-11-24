import 'package:flutter/material.dart';
import 'package:myapp/model/car.dart';
import 'package:myapp/view/add_car.dart';

class ListCars extends StatefulWidget {
  final List<Car> _listCar = [];

  ListCars({super.key});

  @override
  State<ListCars> createState() => _ListCarState();
}

class _ListCarState extends State<ListCars> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LISTA DE CARROS'),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: Colors.blueGrey.shade800,
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: ListView.builder(
          itemCount: widget._listCar.length,
          itemBuilder: (contex, index) {
            // ignore: unused_local_variable
            final car = widget._listCar[index];
            return CarCard(car);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent.shade400,
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return AddCars();
          })).then((car) => {
                if (car != null)
                  {
                    setState(() {
                      widget._listCar.add(car);
                    })
                  }
              });
        },
      ),
    );
  }
}

class CarCard extends StatelessWidget {
  final Car _car;

  const CarCard(this._car, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      title: Text(_car.name),
      subtitle: Text(_car.year.toString()),
      trailing: Text(_car.color),
      textColor: Colors.white,
      tileColor: Colors.blueGrey.shade700,
    ));
  }
}

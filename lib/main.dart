import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final mycontroller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    print("DIRENDER");
    return GetMaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() {
                print("BUILD WIDGET TEXT");
                return Text(
                  '${mycontroller.data.value}',
                  style: TextStyle(fontSize: 60),
                );
              }),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      mycontroller.decrement();
                    },
                    child: Text("-"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      mycontroller.increment();
                    },
                    child: Text("+"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Controller extends GetxController {
  var data = 0.obs;
  increment() {
    data++;
  }

  decrement() {
    data--;
  }
}

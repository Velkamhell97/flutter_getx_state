import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state/src/controllers/user_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //-Estamos inyectando una dependencia a este context, en este caso de un UserController
    //-En getx cuando un observable cambia no se reibuja en widget, al menos en esta alternativa
    //-solo se actaulizara los valores del controller dentro del Obx
    final userController = Get.put(UserController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          IconButton(
            //-Navegacion getx
            // onPressed: () => Get.to(const DetailPage()), 
            onPressed: () => Get.toNamed('/detail', arguments: {'name':'daniel', 'age':24}), 
            icon: const Icon(Icons.arrow_forward)
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Obx(() {
          if(!userController.existUser.value){
            return const Center(child: Text('There is not loaded user'));
          }

          final user = userController.user.value;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('General', style: Theme.of(context).textTheme.titleLarge),
              ListTile(title: Text('Name: ${user.name}')),
              ListTile(title: Text('Age: ${user.age ?? ''}')),

              const SizedBox(height: 10.0),

              Text('Professions', style: Theme.of(context).textTheme.titleLarge),
              for(String profession in user.professions) ListTile(title: Text(profession))
            ],
          );
        }),
      )
    );
  }
}
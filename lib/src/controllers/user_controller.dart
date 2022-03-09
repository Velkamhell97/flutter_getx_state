import 'package:get/get.dart';

import '../models/user.dart';

class UserController extends GetxController {
  //-En getx con agregar un obs a una propiedad ya estaremos escuchando sus cambios
  RxBool existUser = false.obs;

  Rx<User> user = User().obs;

  void setUser(User user){
    this.user.value = user;
    existUser.value = true;
  }

  void setAge(DateTime birthday){
    if(existUser.value){
      user.update((val) { 
        val!.birthday = birthday;
      });
    }
  }

  void addProffesion(String profession){
    if(existUser.value){
      user.update((val) { 
        val!.professions.add(profession);
        // val!.professions = [...val.professions, profession];
      });
    }
  }
}
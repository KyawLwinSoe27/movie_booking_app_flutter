import 'package:hive/hive.dart';

import '../../data/vos/user_data_vo.dart';
import '../hive_constants.dart';

class UserDataDao
{
  static final UserDataDao _singleton = UserDataDao._internal();

  factory UserDataDao(){
    return _singleton;
  }

  UserDataDao._internal();

  void saveAllUserData(UserDataVO users) async{
     await getUserDataBox().put('user', users);
  }

  UserDataVO? getUserData(){
    return getUserDataBox().get('user');
  }

  bool deleteUserData(){
     getUserDataBox().delete('user');
     return true;
  }

  Box<UserDataVO> getUserDataBox(){
    return Hive.box<UserDataVO>(BOX_NAME_USER_DATA_VO);
  }
}
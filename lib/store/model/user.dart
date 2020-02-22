import 'package:hd_man/store/actions/user.dart';

class UserViewModel {
  UserState state;
  Function() onIncreaseCounter;

  UserViewModel({this.state, this.onIncreaseCounter});
}

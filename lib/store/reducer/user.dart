import 'package:hd_man/store/actions/user.dart';

UserState userReducer(UserState state, dynamic action) {
  if (action == "addUser") {
    state.user = action.payload;
    return state;
  }

  return state;
}

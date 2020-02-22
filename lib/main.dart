import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:hd_man/routes.dart';
import 'package:hd_man/store/actions/user.dart';
import 'package:hd_man/store/reducer/user.dart';
import 'package:redux/redux.dart';

void main() {
  Store<UserState> store = Store<UserState>(userReducer,
      initialState: UserState({'username': 'neotdot'}));
  runApp(MyApp(store));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  final Store<UserState> store;
  MyApp(this.store);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: StoreProvider<UserState>(
          store: store,
          child: MaterialApp(
            title: 'My Redux App',
            theme: ThemeData(
              primarySwatch: Colors.red,
            ),
            onGenerateRoute: RouteGenerator.generateRoute,
            initialRoute: '/auth',
          )),
    );
  }
}

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: HomeScreen(),
//     );
//   }
// }

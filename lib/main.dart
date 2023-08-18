import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/utils/block_observer.dart';
import 'core/utils/constant.dart';
import 'core/utils/shared_preferences.dart';
import 'core/utils/theme.dart';
import 'features/layout/layout.dart';
import 'features/layout/manger/layout_cubit.dart';
import 'features/on_boarding/presentation/views/on_boarding_view.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = MyBlocObserver();
  await SharedPreference.init();
  uid = SharedPreference.getData(key: 'uid');
  runApp(const FIP());
}
// auth refactor
class FIP extends StatelessWidget {
  const FIP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [BlocProvider(create: (context) => LayoutCubit()..getUserData()..getCategory()..getProduct())],
      child: MaterialApp(
        theme: lightTheme,
        debugShowCheckedModeBanner: false,
        home: uid!=null?const LayoutScreen():const OnBoardingView(),
      ),
    );
  }
}







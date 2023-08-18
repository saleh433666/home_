import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/auth_model.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) {
    return BlocProvider.of(context);
  }

  bool obscureText = true;
  IconData suffixIcon = Icons.visibility;

  void changePassVisibility() {
    obscureText = !obscureText;
    obscureText
        ? suffixIcon = Icons.visibility
        : suffixIcon = Icons.visibility_off;
    emit(ShowPassVisibility());
  }

// Start Register


  Future<void> userRegister(
      { String? email,
        String? password,
        String? phone,
        String? name,}) async {
    emit(RegisterLoading());
    try{
      var user =
      await  FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email!, password: password!);
      createUser(
          email: email,
          password: password,
          phone: phone,
          name: name,
          uid: user.user?.uid);
    } on FirebaseAuthException catch (e) {
      emit(RegisterError(e.code.toString()));
    } catch (e) {
      emit(RegisterError(e.toString()));
    }
  }

  // void userRegister({
  //   String? email,
  //   String? password,
  //   String? phone,
  //   String? name,
  // }) {
  //   emit(RegisterLoading());
  //   FirebaseAuth.instance
  //       .createUserWithEmailAndPassword(email: email!, password: password!)
  //       .then((value) {
  //     createUser(
  //         email: email,
  //         password: password,
  //         phone: phone,
  //         name: name,
  //         uid: value.user?.uid);
  //   }).catchError((error) {
  //     emit(RegisterError(error.toString()));
  //   });
  // }

  Future<void> createUser({
    String? email,
    String? password,
    String? uid,
    String? phone,
    String? name,
  }) async {
    UserModel model = UserModel(
      name: name,
      email: email,
      password: password,
      phone: phone,
      uid: uid,
      bio: 'write your things',
      photo:
      'https://media.wired.com/photos/598e35fb99d76447c4eb1f28/16:9/w_2123,h_1194,c_limit/phonepicutres-TA.jpg',
      photoCover:
      'https://st2.depositphotos.com/2550635/9440/i/450/depositphotos_94407988-stock-photo-silhouette-of-person-in-sportswear.jpg',
    );
   await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .set(model.toMap())
        .then((value) {
      emit(RegisterSuccess(uid!));
    }).catchError((error) {
      emit(RegisterError(error.toString()));
      print(error);
    });
  }

// END Register

// Start Login

  // Future<void> userLogin({
  //   String? email,
  //   String? password,
  // }) async {
  //   emit(LoginLoading());
  //   await FirebaseAuth.instance.signInWithEmailAndPassword(
  //       email: email!, password: password!).then((value){
  //         emit(LoginSuccess(value.user!.uid));
  //   }).catchError((e){
  //     emit(LoginError(e.toString()));
  //   });
  // }

  Future<void> userLogin(
      {    String? email,
        String? password,}) async {
    emit(LoginLoading());
    try{

      UserCredential user =
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      emit(LoginSuccess(user.user!.uid));
    } on FirebaseAuthException catch (e) {
        emit(LoginError(e.code.toString() ));
    } catch (e) {
      emit(LoginError( e.toString()));
    }
  }


// END Login
}

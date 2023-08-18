import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/utils/constant.dart';
import '../../auth/data/model/auth_model.dart';
import '../../categories/presentation/view/categories_view.dart';
import '../../home/data/model/product_model.dart';
import '../../home/presentation/view/home_screen.dart';
import '../../profile/presentation/view/profile_view.dart';
part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());
  static LayoutCubit get(context){
    return BlocProvider.of(context);
  }

  int currentIndex=0;
  void changeBottomScreen(index){
    currentIndex=index;
    emit(ChangeBottomScreen());
  }
  List<Widget>bottomScreen=const [HomeScreen(),CategoriesView(),ProfileView()];
  List<String>titles=const ['Main Services','Category','Profile'];


  UserModel? userModel;
  void getUserData() {
    emit(GetUserDataLoading());
    FirebaseFirestore.instance.collection('users').doc(uid).get().then((value) {
      userModel = UserModel.fromJson(value.data()!);
      emit(GetUserDataSuccess());
    }).catchError((error) {
      emit(GetUserDataError(error.toString()));
    });
  }

  List<ProductModel>category=[];
  Future<void>getCategory()async{
    emit(GetCategoryLoading());
    try{
      var collRef=await FirebaseFirestore.instance.collection('category').get();
      for (var element in collRef.docs) {
        category.add(ProductModel.fromJson(element.data()));
      }
      emit(GetCategorySuccess());
    }catch(error){
      emit(GetCategoryError());

    }
  }

  List<ProductModel>product=[];
  Future<void>getProduct()async{
    emit(GetProductLoading());
    try{
      var collRef=await FirebaseFirestore.instance.collection('product').get();
      for (var element in collRef.docs) {
        product.add(ProductModel.fromJson(element.data()));
      }
      emit(GetProductSuccess());
    }catch(error){
      emit(GetProductError());
    }
  }

  List<ProductModel>banners=[];
  Future<void>getBanners()async{
    emit(GetBannersLoading());
    try{
      var collRef=await FirebaseFirestore.instance.collection('banners').get();
      for (var element in collRef.docs) {
        banners.add(ProductModel.fromJson(element.data()));
      }
      emit(GetBannersSuccess());
    }catch(error){
      emit(GetBannersError());
    }
  }


}
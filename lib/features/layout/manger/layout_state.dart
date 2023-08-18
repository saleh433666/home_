part of 'layout_cubit.dart';

@immutable
abstract class LayoutState {}

class LayoutInitial extends LayoutState {}
class ChangeBottomScreen extends LayoutState {}
class GetUserDataLoading extends LayoutState {}
class GetUserDataSuccess extends LayoutState {}
class GetUserDataError extends LayoutState {
  final String error;
  GetUserDataError(this.error);
}

class GetCategoryLoading extends LayoutState {}
class GetCategorySuccess extends LayoutState {}
class GetCategoryError extends LayoutState {}

class GetProductLoading extends LayoutState {}
class GetProductSuccess extends LayoutState {}
class GetProductError extends LayoutState {}

class GetBannersLoading extends LayoutState {}
class GetBannersSuccess extends LayoutState {}
class GetBannersError extends LayoutState {}

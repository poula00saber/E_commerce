part of 'get_products_cubit.dart';

@immutable
sealed class GetProductsState {}

final class GetProductsInitial extends GetProductsState {}

final class GetProductsLoading extends GetProductsState {}

final class GetProductsFailure extends GetProductsState {
  final String error;

  GetProductsFailure({required this.error});
}

final class GetProductsSuccess extends GetProductsState {
  final List<Product> productList;

  GetProductsSuccess({required this.productList});
}

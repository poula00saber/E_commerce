import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../constants.dart';
import '../../models/product.dart';
import '../../services/product_service.dart';

part 'get_products_state.dart';

class GetProductsCubit extends Cubit<GetProductsState> {
  GetProductsCubit() : super(GetProductsInitial());

  getProducts() async {
    emit(GetProductsLoading());
    try {
      List<Product> products = await ProductServices().getData(
          path: ApiConstant.baseUrl + ApiConstant.productEndpoints);

      emit(GetProductsSuccess(productList: products));
    } catch (e) {
      emit(GetProductsFailure(error: e.toString()));
    }
  }
}

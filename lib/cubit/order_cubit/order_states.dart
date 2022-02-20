import 'package:khadamatic_auth/models/order_model.dart';

abstract class OrderStates {}
class InitialOrderState extends OrderStates{}
class PostOrderSuccess extends OrderStates{
  final OrderModel orderModel;

  PostOrderSuccess(this.orderModel);
}
class PostOrderLoading extends OrderStates{}
class PostOrderError extends OrderStates{
  final String error;

  PostOrderError(this.error);
}

import 'package:khadamatic_auth/models/client_orders_model.dart';
import 'package:khadamatic_auth/models/client_profile_model.dart';
import 'package:khadamatic_auth/models/get_offers_deal_model.dart';

abstract class TransactionStates{}
class InitialTransactionState extends TransactionStates{}
class GetTransactionSuccess extends TransactionStates{
  final ClientOrdersModel clientOrdersModel;

  GetTransactionSuccess(this.clientOrdersModel);
}
class GetTransactionError extends TransactionStates{
final String error;

  GetTransactionError(this.error);
}
class GetTransactionLoading extends TransactionStates{}
class GetClientProfileLoading extends TransactionStates{}
class GetClientProfileSuccess extends TransactionStates{
  final ClientProfileModel clientProfileModel;

  GetClientProfileSuccess(this.clientProfileModel);
}
class GetClientProfileError extends TransactionStates{
  final String error;

  GetClientProfileError(this.error);
}

class GetOffersDealSuccess extends TransactionStates{
  final GetOffersDealModel getOffersDealModel;

  GetOffersDealSuccess(this.getOffersDealModel);
}
class GetOffersDealLoading extends TransactionStates{}
class GetOffersDealError extends TransactionStates{
  final String error;

  GetOffersDealError(this.error);
}
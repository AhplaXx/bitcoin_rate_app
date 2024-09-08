import 'package:elementlist/src/models/bitcoin_model.dart';
import 'package:elementlist/src/repo/api_status.dart';
import 'package:elementlist/src/repo/bitcoin_services.dart';
import 'package:flutter/foundation.dart';

class BitcoinViewModel extends ChangeNotifier {
  bool _loading = false;
  BitcoinModel? _bitcoin;

  bool get loading => _loading;
  BitcoinModel? get bitcoin => _bitcoin;

  BitcoinViewModel() {
    _initialize();
  }

  Future<void> _initialize() async {
    await getBitcoin();
  }

  set setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  set setBitcoin(BitcoinModel? bitcoin) {
    _bitcoin = bitcoin;
    notifyListeners();
  }

  Future<void> getBitcoin() async {
    setLoading = true;

    var response = await BitcoinServices.getBitcoin();

    if (response is Success) {
      _bitcoin = BitcoinModel.fromJson(response.response as Map<String, dynamic>);
    } else if (response is Failure) {
      print("Failure: ${response.response}");
    }

    setLoading = false;
  }
}

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'package:ice_app_new/models/transferin.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TransferinData with ChangeNotifier {
  final String url_to_in_list =
      //   "http://192.168.1.120/icesystem/frontend/web/api/transfer/inlist";
      "http://119.59.100.74/icesystem/frontend/web/api/transfer/inlist";

  List<Transferin> _transferin;
  List<Transferin> get listtransferin => _transferin;
  bool _isLoading = false;
  bool _isApicon = false;
  int _id = 0;

  int get idTransferin => _id;

  set idTransferin(int val) {
    _id = val;
    notifyListeners();
  }

  set listtransferin(List<Transferin> val) {
    _transferin = val;
    notifyListeners();
  }

  bool get is_loading {
    return _isLoading;
  }

  bool get is_apicon {
    return _isApicon;
  }

  Future<dynamic> fetTransferin() async {
    String _car_id = "";
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('user_id') != null) {
      _car_id = prefs.getString('emp_car_id');
    }

    final Map<String, dynamic> filterData = {'car_id': _car_id};
    // _isLoading = true;
    notifyListeners();
    print('car_id is $filterData');
    try {
      http.Response response;
      response = await http.post(
        Uri.encodeFull(url_to_in_list),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(filterData),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> res = json.decode(response.body);
        List<Transferin> data = [];
        print('data customer length is ${res["data"].length}');
        //    print('data server is ${res["data"]}');

        if (res == null) {
          _isLoading = false;
          notifyListeners();
          return;
        }

        for (var i = 0; i < res['data'].length; i++) {
          // var product = Transferin.fromJson(res[i]);
          //print(res['data'][i]['code']);
          // data.add(product);
          final Transferin _result = Transferin(
            transfer_id: res['data'][i]['transfer_id'].toString(),
            journal_no: res['data'][i]['journal_no'].toString(),
            from_route: res['data'][i]['from_route'].toString(),
            from_car_no: res['data'][i]['from_car_name'].toString(),
            from_order_no: res['data'][i]['to_order_no'].toString(),
            qty: res['data'][i]['qty'].toString(),
            product_id: res['data'][i]['product_id'].toString(),
            product_name: res['data'][i]['product_name'].toString(),
            sale_price: res['data'][i]['sale_price'].toString(),
          );

          //  print('data from server is ${customerresult}');
          data.add(_result);
        }

        listtransferin = data;
        _isLoading = false;
        _isApicon = true;
        notifyListeners();
        return listtransferin;
      }
    } catch (_) {
      _isApicon = false;
    }
  }
}

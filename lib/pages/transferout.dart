import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ice_app_new_omnoi/providers/transferout.dart';
import 'package:ice_app_new_omnoi/widgets/transferout/transferout_item.dart';

class TransferoutPage extends StatefulWidget {
  @override
  _JournalissuePageState createState() => _JournalissuePageState();
}

class _JournalissuePageState extends State<TransferoutPage> {
  // var _isInit = true;
  // var _isLoading = false;

  Future _transferoutFuture;
  Future _obtainTransferoutFuture() {
    return Provider.of<TransferoutData>(context, listen: false)
        .fetTransferout();
  }

  @override
  initState() {
    _transferoutFuture = _obtainTransferoutFuture();
    //ActivityCon();
    //_checkinternet();
    // try {
    //   widget.model.fetchOrders();
    // } on TimeoutException catch (_) {
    //   _showdialog('Noity', 'Connection time out!');
    // }

    super.initState();
  }

  @override
  void didChangeDependencies() {
    // if (_isInit) {
    //   setState(() {
    //     _isLoading = true;
    //   });
    //   Provider.of<TransferoutData>(context, listen: false)
    //       .fetTransferout()
    //       .then((_) {
    //     setState(() {
    //       _isLoading = false;
    //     });
    //   });
    // }
    // _isInit = false;
    super.didChangeDependencies();
  }

  Widget _buildProductList() {
    TransferoutData transferout =
        Provider.of<TransferoutData>(context, listen: false);
    Widget content;
    content = FutureBuilder(
      future: _transferoutFuture,
      builder: (context, dataSnapshort) {
        if (dataSnapshort.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else {
          if (dataSnapshort.error != null) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Container(child: Transferoutitem());
          }
        }
      },
    );

    return RefreshIndicator(
      child: content,
      onRefresh: transferout.fetTransferout,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: _buildProductList(),
      ),
    );
    //return Text('test');
  }
}

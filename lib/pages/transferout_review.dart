import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ice_app_new_omnoi/models/transferout.dart';
import 'package:ice_app_new_omnoi/providers/transferout.dart';
import 'package:provider/provider.dart';

class TransferOutReviewPage extends StatefulWidget {
  static const routeName = '/transferoutreview';
  @override
  _TransferOutReviewPageState createState() => _TransferOutReviewPageState();
}

class _TransferOutReviewPageState extends State<TransferOutReviewPage> {
  Widget _buildlist(List<Transferout> transferout_items) {
    Widget productCards;
    if (transferout_items.isNotEmpty) {
      if (transferout_items.length > 0) {
        //print("has list");
        productCards = new ListView.builder(
          itemCount: transferout_items.length,
          itemBuilder: (BuildContext context, int index) {
            return Items(
              transferout_items[index].product_name,
              transferout_items[index].product_name.toString(),
              transferout_items[index].qty.toString(),
            );
          },
        );
      } else {
        return Center(
          child: Text(
            "ไม่พบข้อมูล",
            style: TextStyle(fontSize: 20, color: Colors.grey),
          ),
        );
      }

      return productCards;
    } else {
      return Center(
        child: Text(
          "ไม่พบข้อมูล",
          style: TextStyle(fontSize: 20, color: Colors.grey),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final transfer_data = ModalRoute.of(context).settings.arguments as Map;
    String _id = transfer_data['transfer_id'];
    Provider.of<TransferoutData>(context, listen: false).fetTransferoutnew(_id);

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'รายการโอนสินค้า',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'ตรวจสอบสินค้าและจำนวน',
                  style: TextStyle(fontSize: 16.0),
                )
              ],
            ),
            Expanded(
              child: Consumer<TransferoutData>(
                builder: (context, transferin, _) => transferin
                        .listtransferout.isNotEmpty
                    ? _buildlist(transferin.listtransferoutnew)
                    : Center(
                        child: Text(
                          "ไม่พบข้อมูล",
                          style: TextStyle(fontSize: 20, color: Colors.grey),
                        ),
                      ),
              ),
            ),
            Consumer<TransferoutData>(
              builder: (context, transferin, _) =>
                  transferin.listtransferout[0].transfer_status == "1"
                      ? Row(
                          children: <Widget>[
                            // Expanded(
                            //   child: GestureDetector(
                            //     child: Container(
                            //       color: 1 > 0 ? Colors.red[700] : Colors.red[200],
                            //       child: Padding(
                            //         padding: const EdgeInsets.all(16),
                            //         child: Row(
                            //           mainAxisAlignment: MainAxisAlignment.center,
                            //           children: <Widget>[
                            //             SizedBox(width: 5),
                            //             Text(
                            //               'ไม่รับ',
                            //               style: TextStyle(
                            //                   color: Colors.white,
                            //                   fontWeight: FontWeight.normal,
                            //                   fontSize: 20),
                            //             ),
                            //           ],
                            //         ),
                            //       ),
                            //     ),
                            //     onTap: () {
                            //       return showDialog(
                            //         context: context,
                            //         builder: (context) => AlertDialog(
                            //           title: Text('ยืนยัน'),
                            //           content:
                            //               Text('คุณต้องการยืนยันการใช่หรือไม่'),
                            //           actions: <Widget>[
                            //             FlatButton(
                            //               onPressed: () {
                            //                 Provider.of<TransferinData>(context,
                            //                         listen: false)
                            //                     .accepttransfer(_id);
                            //                 // Navigator.of(context).pop(true);

                            //                 Navigator.push(
                            //                   context,
                            //                   MaterialPageRoute(
                            //                     builder: (context) =>
                            //                         IssuesuccessPage(),
                            //                   ),
                            //                 );
                            //                 // Navigator.of(context).pop(true);
                            //               },
                            //               child: Text('ยืนยัน'),
                            //             ),
                            //             FlatButton(
                            //               onPressed: () {
                            //                 Navigator.of(context).pop(false);
                            //               },
                            //               child: Text('ไม่'),
                            //             ),
                            //           ],
                            //         ),
                            //       );
                            //     },
                            //   ),
                            // ),
                            // Expanded(
                            //   child: GestureDetector(
                            //     child: Container(
                            //       color: 1 > 0
                            //           ? Colors.green[700]
                            //           : Colors.green[200],
                            //       child: Padding(
                            //         padding: const EdgeInsets.all(16),
                            //         child: Row(
                            //           mainAxisAlignment:
                            //               MainAxisAlignment.center,
                            //           children: <Widget>[
                            //             SizedBox(width: 5),
                            //             Text(
                            //               'รับสินค้า',
                            //               style: TextStyle(
                            //                   color: Colors.white,
                            //                   fontWeight: FontWeight.normal,
                            //                   fontSize: 20),
                            //             ),
                            //           ],
                            //         ),
                            //       ),
                            //     ),
                            //     onTap: () {
                            //       return showDialog(
                            //         context: context,
                            //         builder: (context) => AlertDialog(
                            //           title: Text('ยืนยัน'),
                            //           content:
                            //               Text('คุณต้องการยืนยันการใช่หรือไม่'),
                            //           actions: <Widget>[
                            //             FlatButton(
                            //               onPressed: () {
                            //                 Provider.of<TransferinData>(context,
                            //                         listen: false)
                            //                     .accepttransfer(_id);
                            //                 // Navigator.of(context).pop(true);

                            //                 Navigator.push(
                            //                   context,
                            //                   MaterialPageRoute(
                            //                     builder: (context) =>
                            //                         IssuesuccessPage(),
                            //                   ),
                            //                 );

                            //                 // Navigator.of(context).pop(true);
                            //               },
                            //               child: Text('ยืนยัน'),
                            //             ),
                            //             FlatButton(
                            //               onPressed: () {
                            //                 Navigator.of(context).pop(false);
                            //               },
                            //               child: Text('ไม่'),
                            //             ),
                            //           ],
                            //         ),
                            //       );
                            //     },
                            //   ),
                            // ),
                          ],
                        )
                      : Text(''),
            )
          ],
        ),
      ),
    );
  }
}

class Items extends StatelessWidget {
  //orders _orders;
  final String _code;
  final String _name;
  final String _qty;

  Items(
    this._code,
    this._name,
    this._qty,
  );
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {},
      child: Column(
        children: <Widget>[
          ListTile(
            // leading: Text(
            //   "$_code",
            //   style: TextStyle(
            //     fontSize: 16,
            //   ),
            // ),
            title: Text(
              "$_name",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            //  subtitle: Text("$_name"),
            trailing: Text("${_qty}",
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange[800])),
          ),
          Divider(),
        ],
      ),
    );
  }
}

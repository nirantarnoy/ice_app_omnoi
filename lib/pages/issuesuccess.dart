import 'package:flutter/material.dart';
// import 'package:ice_app_new_omnoi/pages/journalissue.dart';
import 'package:ice_app_new_omnoi/pages/main_test.dart';
// import 'package:ice_app_new_omnoi/pages/order.dart';

class IssuesuccessPage extends StatefulWidget {
  @override
  _IssuesuccessPageState createState() => _IssuesuccessPageState();
}

class _IssuesuccessPageState extends State<IssuesuccessPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          // appBar: AppBar(
          //   iconTheme: IconThemeData(color: Colors.white),
          //   title: Text('แจ้งผลการรับชำระเงิน'),
          // ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.check_circle_outline_outlined,
                  color: Colors.green,
                  size: 50.0,
                ),
                Text(
                  'รับสินค้าขึ้นรถเรียบร้อย',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        // ignore: deprecated_member_use
                        child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.blue[500]),
                        child: Text(
                          'กลับหน้าหลัก',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        onPressed: () {
                          // Navigator.of(context).pop(MainTest());
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      MainTest()),
                              (Route<dynamic> route) => false);
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (_) => MainTest(),
                          //   ),
                          // ).then((value) => setState(() {}));
                        },
                      ),
                    ))
                  ],
                )
              ],
            ),
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:ice_app_new/models/delivery_route.dart';
import 'package:ice_app_new/pages/sale.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flushbar/flushbar.dart';

import '../pages/order.dart';
import '../pages/products.dart';
import '../pages/sale.dart';

class MainTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainTest();
  }
}

class _MainTest extends State<MainTest> with SingleTickerProviderStateMixin {
  TabController _tabController;
  int _currentIndex = 0;
  String appTitle = 'วรภัทร ไอซ์';

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 4, vsync: this);
  }

  void _onTaped(int index) {
    print(index);
    setState(() {
      _currentIndex = index;
      if (index == 0) {
        appTitle = 'สินค้า';
      }
      if (index == 1) {
        appTitle = 'ขายสินค้า';
      }
      if (index == 2) {
        appTitle = 'รับ-โอน';
      }
      if (index == 3) {
        appTitle = 'ปิดการขาย';
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => OrderPage(widget.model)),
        // );
      }
      if (index == 3) {
        //_logout();
      }
    });
  }

  void show_Title_n_message_Flushbar(BuildContext context) {
    Flushbar(
      title: 'Success',
      message: 'Form Submitted successfully',
      icon: Icon(
        Icons.done_outline,
        size: 28,
        color: Colors.green.shade300,
      ),
      leftBarIndicatorColor: Colors.blue.shade300,
      duration: Duration(seconds: 3),
    )..show(context);
  }

  void showInfoFlushbar(BuildContext context) {
    FlushbarHelper.createInformation(
      message: 'บันทึกข้อมูลเรียบร้อย',
      title: 'แจ้งให้ทราบ',
      duration: const Duration(seconds: 5),
    ).show(context);
  }

  void _logoutaction(Function logout) async {
    Map<String, dynamic> successInformation;
    successInformation = await logout();
    if (successInformation['success']) {
      print('logout success');
      Navigator.of(context).pop();
    }
  }

  // void _logout() {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return ScopedModelDescendant<MainModel>(
  //           builder: (BuildContext context, Widget child, MainModel model) {
  //         return AlertDialog(
  //           title: Text(
  //             'ยืนยันการออกจากระบบ!',
  //             style: TextStyle(
  //               fontSize: 20.0,
  //               fontWeight: FontWeight.bold,
  //             ),
  //           ),
  //           content: Text(
  //             "คุณต้องการออกจากระบบใช่หรือไม่",
  //             style: TextStyle(color: Colors.red),
  //           ),
  //           actions: <Widget>[
  //             FlatButton(
  //               child: Text('ใช่',
  //                   style: TextStyle(
  //                     fontSize: 20.0,
  //                     fontWeight: FontWeight.bold,
  //                   )),
  //               onPressed: () => _logoutaction(model.logout),
  //             ),
  //             FlatButton(
  //               child: Text('ไม่ใช่',
  //                   style: TextStyle(
  //                     fontSize: 20.0,
  //                     fontWeight: FontWeight.bold,
  //                   )),
  //               onPressed: () {
  //                 Navigator.of(context).pop();
  //               },
  //             ),
  //           ],
  //         );
  //       });
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    List<Widget> tabs = [
      ProductPage(),
      SalePage(),
      null,
      OrderPage(),
    ];
    // List<Widget> tabs = [null, null, null];
    print('building main test page');
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            appTitle,
            style: TextStyle(fontFamily: 'Cloud-Bold', color: Colors.white),
          ),
          actions: <Widget>[
            IconButton(
              //color: Colors.white,
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {
                //showInfoFlushbar(context);
                show_Title_n_message_Flushbar(context);
                // showSearch(context: context, delegate: DataSearch());
              },
            ),
            (_currentIndex == 3)
                ? IconButton(
                    //color: Colors.white,
                    onPressed: () => {},
                    icon: Icon(
                      Icons.add_circle_outline,
                      color: Colors.white,
                    ),
                  )
                : Container(),
            // IconButton(
            //     //color: Colors.white,
            //     icon: Icon(Icons.shopping_cart, color: Colors.white),
            //     onPressed: () {
            //       // Navigator.push(context,
            //       //     MaterialPageRoute(builder: (context) => CardPage()));
            //     }),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.all(0.0),
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text(
                  "Niran Tarlek",
                  style: TextStyle(color: Colors.white),
                ),
                accountEmail: Text(
                  "sale01@vorapat.com",
                  style: TextStyle(color: Colors.white),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text("NT"),
                ),
                otherAccountsPictures: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Text("NT"),
                  ),
                ],
              ),
              ListTile(
                title: Text("Sycn ข้อมูล"),
                trailing: Icon(Icons.sync_alt_outlined),
              ),
              ListTile(
                title: Text("โหลดสินค้าขึ้นรถ"),
                trailing: Icon(Icons.insert_link),
              ),
              ListTile(
                title: Text("บันทึกขายออฟไลน์"),
                trailing: Icon(Icons.delivery_dining),
              ),
              Divider(),
              ListTile(
                title: Text("บันทึกขาย"),
                trailing: Icon(Icons.shopping_cart_outlined),
                onTap: () => {},
              ),
              Divider(),
              ListTile(
                title: Text("ตรวจสอบ ถัง/กระสอบ"),
                trailing: Icon(Icons.check),
                onTap: () => {},
              ),
              Divider(),
              ListTile(
                title: Text("ยืมสินค้า"),
                trailing: Icon(Icons.cached_outlined),
                onTap: () => {},
              ),
              Divider(),
              ListTile(
                title: Text("ออกจากระบบ"),
                trailing: Icon(Icons.power_settings_new_sharp),
                onTap: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        ),
        // body: Center(
        //   child: Text(
        //     'Vorapat Sales Mobile',
        //     style: TextStyle(color: Colors.blue, fontSize: 25.0),
        //   ),
        // ),
        body: tabs[_currentIndex],
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: _currentIndex,
              onTap: _onTaped,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.pages_rounded), title: Text('สินค้า')),
                BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_cart), title: Text('ขายสินค้า')),
                BottomNavigationBarItem(
                    icon: Icon(Icons.transform_sharp), title: Text('รับ-โอน')),
                BottomNavigationBarItem(
                  icon: Icon(Icons.beenhere),
                  title: Text('ปิดการขาย'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

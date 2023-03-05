// import 'package:camera/camera.dart';
//import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:ice_app_new_omnoi/page_offline/createorder_new_offline.dart';
// import 'package:ice_app_new_omnoi/models/transfer_total.dart';
import 'package:ice_app_new_omnoi/pages/assetcheck.dart';
import 'package:ice_app_new_omnoi/pages/carload_review.dart';
import 'package:ice_app_new_omnoi/pages/checkinpage.dart';
import 'package:ice_app_new_omnoi/pages/createorder_boot.dart';
import 'package:ice_app_new_omnoi/pages/createorder_new.dart';
import 'package:ice_app_new_omnoi/pages/createplan.dart';
import 'package:ice_app_new_omnoi/pages/home.dart';
import 'package:ice_app_new_omnoi/pages/journalissue.dart';
import 'package:ice_app_new_omnoi/pages/offlinetest.dart';
import 'package:ice_app_new_omnoi/pages/ordercheckout.dart';
import 'package:ice_app_new_omnoi/pages/paymentcheckout.dart';
import 'package:ice_app_new_omnoi/pages/paymenthistory.dart';
import 'package:ice_app_new_omnoi/pages/plancheckout.dart';
import 'package:ice_app_new_omnoi/pages/plandetail.dart';
// import 'package:ice_app_new_omnoi/pages/take_photo.dart';
import 'package:ice_app_new_omnoi/pages/transferin_review.dart';
import 'package:ice_app_new_omnoi/pages/transferout_review.dart';
import 'package:ice_app_new_omnoi/providers/car.dart';
import 'package:ice_app_new_omnoi/providers/plan.dart';
import 'package:ice_app_new_omnoi/providers/transferin.dart';
import 'package:ice_app_new_omnoi/providers/transferout.dart';
import 'package:ice_app_new_omnoi/sqlite/providers/Offlineitem.dart';
import 'package:ice_app_new_omnoi/sqlite/providers/customer_price.dart';
import 'package:provider/provider.dart';
//import 'package:shared_preferences/shared_preferences.dart';

import 'pages/auth.dart';

import 'providers/product.dart';
import 'providers/customer.dart';
import 'providers/user.dart';
import 'providers/order.dart';
import 'providers/issuedata.dart';
import 'providers/paymentreceive.dart';
import 'pages/main_test.dart';

import 'pages/order.dart';
import 'pages/orderdetail.dart';
import 'pages/createorder.dart';
import 'pages/payment.dart';

//import 'pages/photo_cap.dart';

//void main() => runApp(MyApp());
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  bool _isAuthenticated = false;

  @override
  void initState() {
    // setState(() {
    //   _isNetworkconnect = false;
    // });
    // _model.autoAuthenticate();
    // _model.userSubject.listen((bool isAuthenticated) {
    //   setState(() {
    //     _isAuthenticated = isAuthenticated;
    //   });
    // });

    super.initState();
  }

  // void checkAuthen(UserData userdata) {
  //   userdata.autoAuthenticate();
  //   setState(() {
  //     _isAuthenticated = userdata.is_authenuser;
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    // final UserData users = Provider.of<UserData>(context);
    // checkAuthen(users);
    print('building main page');
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserData>.value(value: UserData()),
        ChangeNotifierProvider<ProductData>.value(value: ProductData()),
        ChangeNotifierProvider<CustomerData>.value(value: CustomerData()),
        ChangeNotifierProvider<OrderData>.value(value: OrderData()),
        ChangeNotifierProvider<IssueData>.value(value: IssueData()),
        ChangeNotifierProvider<PaymentreceiveData>.value(
            value: PaymentreceiveData()),
        ChangeNotifierProvider<TransferoutData>.value(value: TransferoutData()),
        ChangeNotifierProvider<TransferinData>.value(value: TransferinData()),
        ChangeNotifierProvider<CarData>.value(value: CarData()),
        ChangeNotifierProvider<PlanData>.value(value: PlanData()),
        ChangeNotifierProvider<OfflineitemData>.value(value: OfflineitemData()),
        ChangeNotifierProvider<CustomerpriceData>.value(
            value: CustomerpriceData())
      ],
      child: Consumer(builder: (context, UserData users, _) {
        // checkAuthen(users);
        users.autoAuthenticate();
        return MaterialApp(
          // debugShowMaterialGrid: true,
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.light,
          theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.lightBlue,
            accentColor: Colors.lightBlue,
            buttonColor: Colors.blue,
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            accentColor: Colors.amber,
          ),
          // fontFamily: 'Kanit-Regular'),
          home: DoubleBack(
              message: "กดอีกครั้งเพื่อออก",
              //     child: users.is_authenuser ? MainTest() : AuthPage()),
              child: users.is_authenuser ? MainTest() : CheckinPage()),

          routes: {
            OrderPage.routeName: (ctx) => OrderPage(),
            OrderDetailPage.routeName: (ctx) => OrderDetailPage(),
            CreateorderPage.routeName: (ctx) => CreateorderPage(),
            CreateorderNewPage.routeName: (ctx) => CreateorderNewPage(),
            CreateorderBootPage.routeName: (ctx) => CreateorderBootPage(),
            PaymentPage.routeName: (ctx) => PaymentPage(),
            CarloadReviewPage.routeName: (ctx) => CarloadReviewPage(),
            HomePage.routeName: (ctx) => HomePage(),
            PaymentcheckoutPage.routeName: (ctx) => PaymentcheckoutPage(),
            PaymenthistoryPage.routeName: (ctx) => PaymenthistoryPage(),
            OrdercheckoutPage.routeName: (ctx) => OrdercheckoutPage(),
            JournalissuePage.routeName: (ctx) => JournalissuePage(),
            OfflinePage.routeName: (ctx) => OfflinePage(),
            TransferInReviewPage.routeName: (ctx) => TransferInReviewPage(),
            TransferOutReviewPage.routeName: (ctx) => TransferOutReviewPage(),
            AssetcheckPage.routeName: (ctx) => AssetcheckPage(),
            CreateplanPage.routeName: (ctx) => CreateplanPage(),
            PlancheckoutPage.routeName: (ctx) => PlancheckoutPage(),
            PlanDetailPage.routeName: (ctx) => PlanDetailPage(),
            CreateorderNewOfflinePage.routeName: (ctx) =>
                CreateorderNewOfflinePage(),
            //TakePictureScreen.routeName: (ctx) => TakePictureScreen(),
          },
        );
      }),
    );
  }
}

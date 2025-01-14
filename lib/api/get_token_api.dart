// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, depend_on_referenced_packages

import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_introduction_app_ard_grup/components/main_page_view/main_page_view.dart';
import 'package:flutter_introduction_app_ard_grup/widgets/dialogWidgets/customDialogOnlyConfirm.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../components/list_view/list_view.dart';
import '../components/login/login.dart';
import 'api_repository.dart';
import 'dart:convert';
import 'package:archive/archive.dart';
import 'package:flutter_introduction_app_ard_grup/api/static_variables.dart';
import '../models/user.model.dart';

void tokenGet(BuildContext context) async {
  //Api servisi create ediliyor.
  final apirepository = APIRepository();
  WidgetsFlutterBinding.ensureInitialized();

  //local storage bilgileri çekiliyor.
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var token = prefs.getString("Token");
  var userName = prefs.getString("cryptedUserName");
  var password = prefs.getString("cryptedPassword");

  //Kullanıcının kayıt ettiği dil tercihi çekilerek dil seçeneği setlenir. Eğer local storage içerisinde herhangi bir bilgi bulunamaz ise "tr" olarak setlenir.
  var currentlanguage = prefs.getString("lang");
  if (currentlanguage == null) {
    context.setLocale(Locale("tr"));
  } else {
    context.setLocale(Locale(currentlanguage));
  }

  //eğer token bilgisi mevcut ise decode edilerek içerisinde bulunan bilgiler alınıyor.
  if (token != null) {
    Uint8List decodableUserName = base64.decode(userName!);
    var gzipBytesUserName = GZipDecoder().decodeBytes(decodableUserName);
    Uint8List decodablePassword = base64.decode(password!);
    var gzipBytesPassword = GZipDecoder().decodeBytes(decodablePassword);
    var decodedUserName = utf8.decode(gzipBytesUserName);
    var decodedPassword = utf8.decode(gzipBytesPassword);

    //decode edilen bilgiler statik olarak uygulama içerisinde kullanılmak üzere kayıt ediliyor.
    //Web uygulamalarda bulunan session storage olarak düşünülebilir.

    StaticVariables.token = token;

    //Eğer uygulama uzun süre kullanılmamış ve kullanılan tokenın bir lifetime süresi var ise kullanıcıya login ekranı gösterilmeden
    //login ederek uygulama içerisine giriş yaptırılır.
    //opsiyonel

    UserResult apiResult = await apirepository.login(
        userName: decodedUserName,
        password: decodedPassword,
        rememberMe: false);

    if (apiResult.success!) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: ((context) => const MainPage())));
      // Navigator.push(
      //     context, MaterialPageRoute(builder: ((context) => const MainPage())));
    } else {
      CustomAlertDialogOnlyConfirm(context, () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: ((context) => const Login())));
      }, "Uyarı", apiResult.message!, ArtSweetAlertType.warning, "Tamam");
    }
  } else {
    //token bilgisi yok ise login ekranına gönderilir.
    Navigator.push(context, MaterialPageRoute(builder: ((context) => Login())));
  }
}

import 'dart:io';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_firebase_messaging_example/screens/screen_1.dart';
import 'package:google_fonts/google_fonts.dart';

import '../confriguration/size_config.dart';
import '../contants/app_colors.dart';
import '../contants/app_string.dart';
import '../main.dart';
import 'dart:developer' as developer;



class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({Key? key}) : super(key: key);
  static void crashReport(){
    developer.log('log me', name: 'my.app.category');
    if (kDebugMode) {
      print("This is a crash1");
    }
    throw Exception("This is a crash!");

  }
  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {

  @override
  Widget build(BuildContext context) {
    FirebaseAnalytics.instance.logEvent(
      name: "select_content",
    );
    SizeConfig().init(context);
    return Stack(
      children: <Widget>[
        Image.asset(
          "assets/images/get_started_background_img.png",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
            backgroundColor: Colors.transparent,
          appBar: AppBar(
            toolbarHeight: 0,
            elevation: 0,
            backgroundColor: Colors.transparent,
            systemOverlayStyle: SystemUiOverlayStyle(
              systemNavigationBarColor:  AppColors.kPrimaryColorSkyBlue,
              statusBarColor: AppColors.kPrimaryColorSkyBlue, // <-- SEE HERE
              statusBarIconBrightness: Brightness.dark, //<-- For Android SEE HERE (dark icons)
              statusBarBrightness: Brightness.light, //<-- For iOS SEE HERE (dark icons)
            ),
          ),
          body: Padding(
            padding: EdgeInsets.only(top:SizeConfig.screenHeight!*0.07,left: SizeConfig.screenWidth!*0.08,right: 10,bottom: 0 ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppString.getStartedTravelText,style: const TextStyle(
                    height:1,
                  color: Colors.white,
                  fontSize: 50,fontFamily: "Larken Serif Trial"
                ),
                ),
                Text(
                  AppString.getStartedNeedText,style: GoogleFonts.inter(
                  textStyle: Theme.of(context).textTheme.headline4,
                  fontSize: 21,
                  fontWeight: FontWeight.normal,
                  color: Colors.white
                )
                ),
                SizedBox(
                  height: SizeConfig.screenHeight!*0.05,
                ),
                letStartedContainer(onTap:() {
                  print("Lets Start is called");
                  FirebaseAnalytics.instance.logEvent(
                    name: "select_content",
                  );
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Screen1()));
                  GetStartedScreen.crashReport();
                }, boxText:AppString.getStartedText,)
              ],
            ),
          ),
          )
      ],
    );
  }
  Widget letStartedContainer({required var onTap,required String boxText}){
    return InkWell(
      onTap: onTap,
      child: Container(
        height:SizeConfig.screenHeight!*0.06,
        width: SizeConfig.screenWidth!*0.4,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50)
        ),
        child: Center(child: Text(boxText,style: TextStyle(
          fontSize: 18,
            color: AppColors.kPrimaryColorSkyBlueDark,fontWeight:FontWeight.bold
        ),)),
      ),
    );
  }

}





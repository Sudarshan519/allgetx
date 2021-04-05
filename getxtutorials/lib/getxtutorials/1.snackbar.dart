import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetxSnackBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        RaisedButton(onPressed: (){
          Get.snackbar('title','message',
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text('Another message'),
          messageText: Text('another'),
          colorText: Colors.red,
          backgroundColor: Colors.black,
          borderRadius: 30,
          margin: EdgeInsets.all(10),
          maxWidth: 100,animationDuration: Duration(milliseconds:200),
          backgroundGradient: LinearGradient(colors: [Colors.red,Colors.green]),
          borderColor: Colors.green,borderWidth: 10,boxShadows: [BoxShadow(color:Colors.yellow,offset:Offset(30,50),spreadRadius:20,blurRadius:8)],
          isDismissible: true,
          dismissDirection: SnackDismissDirection.VERTICAL,
          forwardAnimationCurve: Curves.bounceInOut,
          duration: Duration(milliseconds:8000),
          icon: Icon(Icons.send,color: Colors.white,),
          shouldIconPulse: false,
          leftBarIndicatorColor: Colors.red,
          mainButton: TextButton(onPressed: (){}, child: Text('Retry')),
          onTap: (val){
            print('retyr clicked');
          },
          overlayBlur: 4,
          overlayColor: Colors.grey,
          padding: EdgeInsets.all(4),
          showProgressIndicator: true,
          progressIndicatorBackgroundColor: Colors.deepOrange,
          reverseAnimationCurve: Curves.bounceInOut,
          );
        })
      ],),
    );
  }
}
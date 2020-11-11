import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:toast/toast.dart';

class BasePage extends StatefulWidget {
  BasePage({Key key}) : super(key: key);

  @override
  BasePageState createState() => BasePageState();
}



class BasePageState<T extends BasePage> extends State<T> {

  var isLoading = false;

 void showLoadingDialoge() {

    new Future.delayed(Duration.zero, ()
    {
      if(!isLoading)
      showDialog(context: context,
          builder: (BuildContext context) {
            return loader;
          });
      isLoading = true;
    });

  }


  void hideLoadingDialoge(){
   if(isLoading)
    Navigator.of(context).pop();
    isLoading = false;
  }

  void showToast(String msg, {int duration}) {
    Toast.show(msg, context, duration: duration, gravity: Toast.BOTTOM);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

    static final loader =  Center(
      child: new AlertDialog(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        content: spinkitloader,
      ),
    );

  static final spinkitloader  = Center(
    child: new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[

        SpinKitWave(
          itemBuilder: (BuildContext context, int index) {
            return DecoratedBox(
              decoration: BoxDecoration(
                color: index.isEven ? Colors.black : Colors.black45,
              ),
            );
          },
          size: 50,
        ),

        new SizedBox(height: 13.0,),

        new Text("Please Wait...", textAlign: TextAlign.center,
          style: new TextStyle(fontSize: 16.0, fontWeight :FontWeight.bold, color: Colors.black),)

      ],
    ),

  );

}

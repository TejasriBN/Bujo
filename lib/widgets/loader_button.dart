import 'package:flutter/material.dart';

class LoaderButton extends StatelessWidget {
  final String btnTxt;
  final bool isLoading;
  final void Function()? onPressed;
  final Color btnColor;

  const LoaderButton(
      {this.btnTxt = '',
      this.isLoading = false,
      this.onPressed,
      this.btnColor = const Color(0xfff79f1f)});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(primary: btnColor),
            onPressed: onPressed,
            child: isLoading
                ? Center(
                    child: Image.asset(
                      'assets/btn_loader.gif',
                      height: 48.0,
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        btnTxt,
                        maxLines: 1,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w800),
                      ),
                    ),
                  )));
  }
}

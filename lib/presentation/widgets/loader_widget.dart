import 'dart:ui';

import 'package:flutter/material.dart';

class LoaderWidget extends StatelessWidget {
  /// Loading widget showing a CircularProgressIndicator in the center of the screen
  const LoaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: CircularProgressIndicator()
      )
    );
  }

  /// Method to show a loader widget.
  Future show(BuildContext context){
    return showDialog(
      context: context, 
      barrierColor: Colors.white.withOpacity(0.5),
      barrierDismissible: false,
      builder: (context) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1,),
        child: const LoaderWidget()
      )
    );
  }
}
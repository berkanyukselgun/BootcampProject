import 'package:flutter/material.dart';

class NotFoundNavigatonWidget extends StatelessWidget {
  const NotFoundNavigatonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Sayfa bulunamadı")),
    );
  }
}

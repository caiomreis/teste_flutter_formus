import 'package:Formus/app/components/button/button.dart';
import 'package:Formus/app/components/formus_snackbar/formus_snackbar.dart';
import 'package:Formus/app/style/formus_icons.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FormusButton(
              text: 'teste',
              onPress: () async {
                if (kDebugMode) {
                  print('oi');
                }
                FormusSnackBar.simple(
                    title: 'Teste',
                    kind: FormusSnackBarKindEnum.info,
                    icon: FormusIconsEnum.build);
              },
            ),
          ],
        ),
      ),
    );
  }
}

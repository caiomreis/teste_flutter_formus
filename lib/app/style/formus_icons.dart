// ignore_for_file: deprecated_member_use, constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Para adicionar novos ícones, faça:
///
/// 1 - Adicione o SVG na pasta de [assets/icons], com o nome do
/// arquivo no padrão snake_case e a imagem sem bordas;
///
/// 2 - Adicione o item no enum [FormusIconsEnum] com o nome do arquivo
/// no padrão camelCase;
///
/// 3 - Adicione aos switchs da extensão [FormusIconsEnumExtension] como
/// resolver cada tamanho de ícone.
enum FormusIconsEnum {
  email,
  logo,
  arrowCircularRight,
  calendar,
  donate,
  user,
  squareChart,
  menu,
  build,
  dots_indicator,
  clock,
  close_bold,
  plus_circle,
  google,
  lock,
  refresh,
  edit_pencil
}

extension FormusIconsEnumExtension on FormusIconsEnum {
  /// Retorna o [assetName] transformando o nome do enum
  /// em uma string, alterando de camelCase para snake_case
  String get assetName {
    RegExp upperCaseLetters = RegExp('(?<=[a-z])[A-Z]');
    return 'assets/icons/${name.replaceAllMapped(upperCaseLetters, (m) {
      final String match = m.group(0) ?? '';
      return '_$match';
    }).toLowerCase()}.svg';
  }
}

class FormusIcon extends StatelessWidget {
  final FormusIconsEnum icon;
  final double width;
  final double height;
  final double? areaWidth;
  final double? areaHeight;
  final VoidCallback? onTap;
  final Color? color;

  const FormusIcon({
    Key? key,
    required this.icon,
    required this.width,
    required this.height,
    this.areaWidth,
    this.areaHeight,
    this.onTap,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: SizedBox(
        height: areaHeight ?? height,
        width: areaWidth ?? width,
        child: Center(
          child: SvgPicture.asset(
            icon.assetName,
            width: width,
            height: height,
            color: color,
          ),
        ),
      ),
    );
  }
}

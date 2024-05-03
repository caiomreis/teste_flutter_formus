import 'package:Formus/app/components/formus_cached_image.dart';
import 'package:Formus/app/components/text/body/body.dart';
import 'package:Formus/app/components/text/label/label.dart';
import 'package:Formus/app/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MovieComponent extends StatelessWidget {
  const MovieComponent({
    super.key,
    this.image,
    required this.title,
    required this.date,
    required this.id,
  });
  final String? image;
  final String title;
  final String date;
  final int id;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: FormusColors.theme.gray.base, // Splash color
      onTap: () {
        Get.toNamed('/movie_detail', parameters: {'id': id.toString()});
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormusCachedImage(
            heigth: 225,
            width: MediaQuery.of(context).size.width,
            label: title,
            imageUrl: 'https://image.tmdb.org/t/p/original/$image',
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 8,
              right: 8,
              top: 8,
            ),
            child: Body.bold(
              text: title,
              textAlign: TextAlign.start,
              maxLines: 2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Label.medium(
              text: 'Lançamento: ${formatDate()}',
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }

  formatDate() {
    try {
      DateTime parseDate = DateFormat("yyyy-MM-dd").parse(date);
      DateTime inputDate = DateTime.parse(parseDate.toString());
      DateFormat outputFormat = DateFormat('dd/MM/yyyy');
      return outputFormat.format(inputDate);
    } catch (e) {
      return '';
    }
  }
}

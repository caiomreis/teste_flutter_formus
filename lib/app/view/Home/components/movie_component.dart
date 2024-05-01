import 'package:Formus/app/components/formus_cached_image.dart';
import 'package:Formus/app/components/text/body/body.dart';
import 'package:Formus/app/components/text/label/label.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MovieComponent extends StatelessWidget {
  const MovieComponent(
      {super.key,
      r,
      required this.image,
      required this.title,
      required this.date});
  final String image;
  final String title;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }

  formatDate() {
    DateTime parseDate = DateFormat("yyyy-MM-dd").parse(date);
    var inputDate = DateTime.parse(parseDate.toString());
    var outputFormat = DateFormat('dd/MM/yyyy');
    var outputDate = outputFormat.format(inputDate);
    return outputDate;
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BlogWidget extends StatelessWidget {
  const BlogWidget({
    super.key, 
    required this.title,
    required this.image,
    required this.body,
    required this.created_at,
  });

  final String title;
  final String image;
  final String body;
  final String created_at;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(image)
              )
            )
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(created_at, style: GoogleFonts.workSans(
                fontSize: 15,
                color: Colors.grey,
              )),
              Text(title,
              style: GoogleFonts.workSans(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              )),
              Row(
                children: [
                  Text('50k', style: GoogleFonts.workSans(
                    fontSize: 15,
                    color: Colors.grey,
                  )),
                  Padding(
                    padding: EdgeInsets.only(left: 2.0, top: 2.0),
                    child: const Icon(Icons.comment, size: 20.0),
                  ),
                  const SizedBox(
                    width: 10,

                  )
                ],
              )
            ],
          ),
        ))
      ],
    );
  }
} 
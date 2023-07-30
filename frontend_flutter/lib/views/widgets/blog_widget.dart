import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BlogWidget extends StatelessWidget {
  const BlogWidget({
    super.key, required this.color,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10)
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('25 Feb', style: GoogleFonts.workSans(
                fontSize: 15,
                color: Colors.grey,
              )),
              Text('How to code tutorial',
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
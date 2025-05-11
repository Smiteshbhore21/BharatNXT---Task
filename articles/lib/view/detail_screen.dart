import 'dart:ui';

import 'package:articles/controller/all_data.dart';
import 'package:articles/controller/session_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({required this.indx, super.key});
  final int indx;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void deactivate() {
    // TODO: implement deactivate
    SessionData.getDataSession();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color.fromRGBO(16, 96, 72, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop(true);
          },
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
        ),
        title: Text(
          "Article Details",
          style: GoogleFonts.poppins(
            fontSize: MediaQuery.of(context).size.width * 0.066964285,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: -50,
            left: -100,
            child: Container(
              height: MediaQuery.of(context).size.width * 0.859375,
              width: MediaQuery.of(context).size.width * 0.859375,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(255, 255, 255, 0),
                    Color.fromRGBO(255, 255, 255, 0.2),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 45,
            left: -23,
            child: Container(
              height: MediaQuery.of(context).size.width * 0.859375,
              width: MediaQuery.of(context).size.width * 0.859375,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(255, 255, 255, 0),
                    Color.fromRGBO(255, 255, 255, 0.2),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 150,
            left: 0,
            right: 0,
            child: SizedBox(
              height: MediaQuery.of(context).size.width * 0.859375,
              width: MediaQuery.of(context).size.width * 0.859375,
              child: SvgPicture.asset("assets/svg/articleSVG.svg"),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width * 0.837053571,
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(30),
                ),
                border: Border.all(
                  width: 3,
                  color: const Color.fromRGBO(250, 250, 250, 0.05),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    Provider.of<Alldata>(context).alldata[widget.indx].title,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: MediaQuery.of(context).size.width * 0.055803571,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    Provider.of<Alldata>(context).alldata[widget.indx].body,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: MediaQuery.of(context).size.width * 0.033482142,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(8, 4, 34, 0.7),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // Text(
                      //   "User ID : ${Provider.of<Alldata>(context).alldata[widget.indx].userId}",
                      //   textAlign: TextAlign.center,
                      //   style: GoogleFonts.poppins(
                      //     fontSize:
                      //         MediaQuery.of(context).size.width * 0.037946428,
                      //     fontWeight: FontWeight.w500,
                      //     color: const Color.fromRGBO(8, 4, 34, 1),
                      //   ),
                      // ),
                      GestureDetector(
                        onTap: () {
                          if (!SessionData.favList.contains(
                              Provider.of<Alldata>(context, listen: false)
                                  .alldata[widget.indx]
                                  .title)) {
                            SessionData.setDataSession(
                                title:
                                    Provider.of<Alldata>(context, listen: false)
                                        .alldata[widget.indx]
                                        .title);
                          } else {
                            SessionData.removeDataSession(
                                title:
                                    Provider.of<Alldata>(context, listen: false)
                                        .alldata[widget.indx]
                                        .title);
                          }
                          setState(() {});
                        },
                        child: Icon(
                          !SessionData.favList.contains(
                                  Provider.of<Alldata>(context, listen: false)
                                      .alldata[widget.indx]
                                      .title)
                              ? Icons.favorite_border
                              : Icons.favorite,
                        ),
                      ),
                      // Text(
                      //   "ID : ${Provider.of<Alldata>(context).alldata[widget.indx].id}",
                      //   textAlign: TextAlign.center,
                      //   style: GoogleFonts.poppins(
                      //     fontSize:
                      //         MediaQuery.of(context).size.width * 0.037946428,
                      //     fontWeight: FontWeight.w500,
                      //     color: const Color.fromRGBO(8, 4, 34, 1),
                      //   ),
                      // ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'dart:developer';

import 'package:articles/controller/all_data.dart';
import 'package:articles/controller/session_data.dart';
import 'package:articles/view/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SessionData.getDataSession();
  }

  @override
  Widget build(BuildContext context) {
    log("In Fav Page");
    return Scaffold(
      backgroundColor: const Color.fromRGBO(16, 96, 72, 1),
      appBar: AppBar(
        title: Text(
          "Favorites Articles",
          style: GoogleFonts.poppins(
            fontSize: MediaQuery.of(context).size.width * 0.066964285,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Provider.of<Alldata>(context).alldata.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: SessionData.favList.length,
                padding: const EdgeInsets.only(
                  top: 20,
                  bottom: 5,
                  left: 10,
                  right: 10,
                ),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          int ind = -1;
                          int n = Provider.of<Alldata>(context, listen: false)
                              .alldata
                              .length;
                          for (int i = 0; i < n; i++) {
                            if (SessionData.favList[index] ==
                                Provider.of<Alldata>(context, listen: false)
                                    .alldata[i]
                                    .title) {
                              ind = i;
                              break;
                            }
                          }
                          Navigator.of(context)
                              .push(
                            MaterialPageRoute(
                              builder: (context) => DetailScreen(indx: ind),
                            ),
                          )
                              .then((removed) {
                            if (removed == true) setState(() {});
                            ;
                          });
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height:
                              MediaQuery.of(context).size.width * 0.133928571,
                          margin: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 5,
                          ),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 5,
                              ),
                              const Icon(
                                Icons.article_rounded,
                                color: Color.fromRGBO(16, 96, 72, 1),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Text(
                                  SessionData.favList[index],
                                  style: GoogleFonts.poppins(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 1,
                        color: Colors.grey,
                      ),
                    ],
                  );
                },
              ),
      ),
    );
  }
}

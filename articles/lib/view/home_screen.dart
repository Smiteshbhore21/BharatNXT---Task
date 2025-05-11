import 'dart:developer';
import 'package:articles/controller/all_data.dart';
import 'package:articles/view/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    if (Provider.of<Alldata>(context).alldata.isEmpty) {
      Provider.of<Alldata>(context, listen: false).fetchArticles();
      log("AllData ${Provider.of<Alldata>(context).alldata}");
    } else {
      log("In Home Page");
    }
    return Scaffold(
      backgroundColor: const Color.fromRGBO(16, 96, 72, 1),
      appBar: AppBar(
        title: Text(
          "Articles",
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
                itemCount: Provider.of<Alldata>(context).alldata.length,
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
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => DetailScreen(
                                indx: index,
                              ),
                            ),
                          );
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
                                  Provider.of<Alldata>(context)
                                      .alldata[index]
                                      .title,
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

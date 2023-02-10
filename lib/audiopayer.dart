// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:audio_app/my_file.dart';
import 'package:audio_app/tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

// ignore: must_be_immutable
class AudioPayer extends StatefulWidget {
  bool mode = true;
  AudioPayer({super.key});

  @override
  State<AudioPayer> createState() => _AudioPayerState();
}

class _AudioPayerState extends State<AudioPayer>
    with SingleTickerProviderStateMixin {
  late List popular = [];
  late List book = [];
  //late ScrollController _scrollController;
  late TabController _tabController;
  renderData() async {
    await DefaultAssetBundle.of(context)
        .loadString('assets/json/popular.json')
        .then((s) {
      setState(() {
        popular = jsonDecode(s);
      });
    });
    await DefaultAssetBundle.of(context)
        .loadString('assets/json/body.json')
        .then((s) {
      setState(() {
        book = jsonDecode(s);
      });
    });
  }

  @override
  void initState() {
    renderData();
    _tabController = TabController(length: 3, vsync: this);
    //_scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.greenAccent,
      child: SafeArea(
        child: Scaffold(
          // appBar: AppBar(
          //   backgroundColor: Colors.transparent,
          // ),
          //backgroundColor: const Color.fromARGB(255, 58, 58, 58),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 11.6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Icon(Icons.menu_sharp),
                    Row(
                      children: <Widget>[
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.search),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.notifications),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              widget.mode = !widget.mode;
                            });
                          },
                          icon: widget.mode
                              ? const Icon(Icons.light_mode)
                              : const Icon(Icons.dark_mode),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                //color: Colors.amberAccent,
                child: const Text(
                  "Popular books",
                  style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Stack(
                children: [
                  SizedBox(
                    height: 170,
                    child: PageView.builder(
                      controller: PageController(viewportFraction: 0.79),
                      itemCount: popular.isEmpty ? 0 : popular.length,
                      itemBuilder: (_, index) {
                        return Animate(
                          child: Container(
                            height: 180,
                            margin: const EdgeInsets.only(
                              left: 12,
                              top: 12,
                              bottom: 10,
                            ),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 192, 180, 73),
                              borderRadius: BorderRadius.circular(12.5),
                              image: DecorationImage(
                                image: AssetImage(popular[index]['img']),
                                fit: BoxFit.cover,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white.withOpacity(0.2),
                                  blurRadius: 12,
                                  offset: const Offset(0, 0),
                                )
                              ],
                            ),
                          ),
                        )
                            .fadeIn(
                              duration: const Duration(seconds: 1),
                            )
                            .then()
                            .scaleY(
                              duration: const Duration(milliseconds: 500),
                            );
                      },
                    ),
                  ),
                ],
              ),
              Expanded(
                child: NestedScrollView(
                  headerSliverBuilder: (BuildContext context, bool isScroll) {
                    return [
                      SliverAppBar(
                        backgroundColor: Theme.of(context)
                            .scaffoldBackgroundColor
                            .withOpacity(0.06),
                        pinned: true,

                        //automaticallyImplyLeading: true,
                        bottom: PreferredSize(
                          preferredSize: const Size.fromHeight(20),
                          child: Container(
                            //color: const Color.fromARGB(255, 58, 58, 58),
                            margin: const EdgeInsets.only(
                              bottom: 12,
                              left: 20,
                            ),
                            child: TabBar(
                              tabs: const [
                                MyTabs(
                                  color: Colors.purpleAccent,
                                  text: 'New',
                                ),
                                MyTabs(
                                  color: Color.fromARGB(255, 22, 99, 61),
                                  text: 'Popular',
                                ),
                                MyTabs(
                                  color: Colors.amberAccent,
                                  text: 'Trending',
                                ),
                              ],
                              indicatorPadding: const EdgeInsets.all(10),
                              indicatorSize: TabBarIndicatorSize.label,
                              controller: _tabController,
                              isScrollable: true,
                              labelPadding: const EdgeInsets.only(
                                bottom: 5,
                                right: 10,
                              ),
                              indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white.withOpacity(0.2),
                                    blurRadius: 7,
                                    offset: const Offset(0, 0),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ];
                  },
                  body: TabBarView(
                    controller: _tabController,
                    children: [
                      ListView.builder(
                        itemCount: book.isEmpty ? 0 : book.length,
                        itemBuilder: (_, index) {
                          return Tabs(
                            imagelocation: book[index]['img'],
                            rating: book[index]['rating'],
                            title: book[index]['title'],
                            text: book[index]['text'],
                          );
                        },
                      ),
                      const Material(
                        child: ListTile(
                          title: Text('data one'),
                          leading: CircleAvatar(
                              //backgroundColor: Colors.grey,
                              ),
                        ),
                      ),
                      const Material(
                        child: ListTile(
                          title: Text('data'),
                          leading: CircleAvatar(
                              //backgroundColor: Colors.grey,
                              ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

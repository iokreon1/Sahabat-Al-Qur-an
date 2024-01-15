// ignore_for_file: deprecated_member_use

import 'package:al_quran/tabs/hijb_tab.dart';
import 'package:al_quran/tabs/page_tab.dart';
import 'package:al_quran/tabs/para_tab.dart';
import 'package:al_quran/tabs/surah_tab.dart';
import 'package:flutter/material.dart';
import 'package:al_quran/globals.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: _appBar(),
      bottomNavigationBar: _bottomNavigationBar(),
      body: DefaultTabController(
        length: 4,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverToBoxAdapter(
                child: _greeting(),
              ),
              SliverAppBar(
                pinned: true,
                elevation: 0,
                backgroundColor: background,
                automaticallyImplyLeading: false,
                shape: Border(
                  bottom: BorderSide(
                    width: 3,
                    color: const Color(0xFFAAAAAA).withOpacity(.1),
                  )
                ),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(0),
                  child: _tab(),
                ),
              ),
            ],
            body: const TabBarView(
              children: [
                SurahTab(),
                ParaTab(),
                PageTab(),
                HijbTab(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TabBar _tab() {
    return TabBar(
      unselectedLabelColor: text,
      labelColor: Colors.white,
      indicatorColor: primary,
      indicatorWeight: 3,
      tabs: [
        _tabitem(label: "Surah"),
        // _tabitem(label: "Para"),
        // _tabitem(label: "Page"),
        // _tabitem(label: "Hijb"),
      ],
    );
  }

  Tab _tabitem({required String label}) {
    return Tab(
      child: Text(
        label,
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Column _greeting() {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: text,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              '',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            _lastRead(),
          ],
        );
  }

  Stack _lastRead() {
    return Stack(
            children: [
              Container(
                height: 131,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [
                      0,
                      .6,
                      1
                    ],
                    colors: [
                      Color(0xFFDF98FA), 
                      Color(0xFFB070FD),
                      Color(0xFF9055FF),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: SvgPicture.asset('assets/svgs/quran.svg'),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset('assets/svgs/book.svg'),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Last Read',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Al-Fatihah',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Ayat No : 1',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
  }

  AppBar _appBar() => AppBar(
    backgroundColor: background,
    automaticallyImplyLeading: false,
    elevation: 0,
    title: Row(
      children: [
        IconButton(onPressed: (() => {}), 
        icon: SvgPicture.asset('assets/svgs/menu-icon.svg')),
        const SizedBox(
          width: 24,
        ),
        Text(
          'Sahabat Al-Quran',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white),
        ),
        const Spacer(),
        IconButton(onPressed: (() => {}), 
        icon: SvgPicture.asset('assets/svgs/search-icon.svg')),
      ],
    ),
  );

  BottomNavigationBar _bottomNavigationBar() => BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    backgroundColor: gray,
    showSelectedLabels: false,
    showUnselectedLabels: false,
    items: [
      _bottomBarItem(icon: "assets/svgs/quran-icon.svg", label: "Quran"),
      _bottomBarItem(icon: "assets/svgs/lamp-icon.svg", label: "Tips"),
      _bottomBarItem(icon: "assets/svgs/pray-icon.svg", label: "Prayer"),
      _bottomBarItem(icon: "assets/svgs/doa-icon.svg", label: "Doa"),
      _bottomBarItem(icon: "assets/svgs/bookmark-icon.svg", label: "Bookmark"),
    ],
  );

  BottomNavigationBarItem _bottomBarItem({
    required String icon, 
    required String label
    }) => BottomNavigationBarItem(
      icon: SvgPicture.asset(
        icon,
        color: text,
        ),
        activeIcon: SvgPicture.asset(
          icon,
          color: primary,
          ),
          label: label);
}
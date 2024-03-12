import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0; // 현재 선택된 탭 인덱스

  bool search = false;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void openSearch() {
    setState(() {
      search = true;
    });
  }

  void closeSearch() {
    setState(() {
      search = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: <Widget>[
            HomeScreen(), // 첫 번째 탭의 화면
            MenuPage(), // 두 번째 탭의 화면, MenuPage를 여기에 포함
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              label: 'Menu',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.rocket),
              label: 'AI',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.card_giftcard),
              label: 'Card',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'My',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
        body: GestureDetector(
          onTap: closeSearch,
          child: Column(
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  decoration:
                      BoxDecoration(color: Colors.grey.withOpacity(0.75)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 38, right: 28),
                    child: Column(
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 75,
                            ),
                            child: TextField(
                              readOnly: !search,
                              cursorColor: Colors.white.withOpacity(0.2),
                              cursorHeight: 22,
                              onTap: openSearch,
                              style: const TextStyle(
                                textBaseline: TextBaseline.alphabetic,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(
                                  left: 30,
                                ),
                                filled: search,
                                fillColor: Colors.black.withOpacity(
                                  0.15,
                                ),
                                suffixIcon: const Padding(
                                  padding: EdgeInsets.only(
                                    right: 20,
                                  ),
                                  child: Icon(
                                    Icons.search,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(
                                    35.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  decoration: const BoxDecoration(color: Colors.white),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 18),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            '대체 재료로 만드는 간단 레시피',
                            style: TextStyle(fontSize: 20),
                          ),
                          Text('재료가 하나쯤 없어도 괜찮아요'),
                          SizedBox(
                            height: 20,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                ItemPreview(
                                  mainText: '깻잎으로 만든 모히또',
                                  hashtag: '럼 베이스',
                                ),
                                SizedBox(
                                  width: 21,
                                ),
                                ItemPreview(
                                  mainText: '깻잎으로 만든 모히또',
                                  hashtag: '럼 베이스',
                                ),
                                SizedBox(
                                  width: 21,
                                ),
                                ItemPreview(
                                  mainText: '깻잎으로 만든 모히또',
                                  hashtag: '럼 베이스',
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 38,
                          ),
                          Text(
                            '이번주 인기 레시피',
                            style: TextStyle(fontSize: 20),
                          ),
                          Text('유저들이 가장 많이 저장한 레시피를 소개합니다.'),
                          SizedBox(
                            height: 20,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                ItemPreview(
                                  mainText: '깻잎으로 만든 모히또',
                                  hashtag: '럼 베이스',
                                ),
                                SizedBox(
                                  width: 21,
                                ),
                                ItemPreview(
                                  mainText: '깻잎으로 만든 모히또',
                                  hashtag: '럼 베이스',
                                ),
                                SizedBox(
                                  width: 21,
                                ),
                                ItemPreview(
                                  mainText: '깻잎으로 만든 모히또',
                                  hashtag: '럼 베이스',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
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

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // MenuPage의 구성은 동일하게 유지
    return Center(child: Text('Menu Page'));
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Text('This is the Home Page'),
      ),
    );
  }
}

class ItemPreview extends StatelessWidget {
  final String mainText, hashtag;

  const ItemPreview({
    super.key,
    required this.mainText,
    required this.hashtag,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.grey.withOpacity(0.6),
              ),
            ),
            Positioned(
              right: 12,
              bottom: 15,
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/favorite.png',
                    scale: 2,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text('100'),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          mainText,
          style: const TextStyle(
            fontSize: 15,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text('# $hashtag'),
      ],
    );
  }
}

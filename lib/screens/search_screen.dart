import 'package:flutter/material.dart';
import 'package:movie_app/networking.dart';
import 'package:movie_app/screens/movie_screen.dart';
import 'package:movie_app/service/movie.dart';
import 'package:scaled_list/scaled_list.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Movie> myList = [];

  updateMovieSearch(String value) async {
    myList = await getSearchList(value);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateMovieSearch('harry');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(20),
                  )),
              onChanged: (value) {
                setState(() {
                  updateMovieSearch(value);
                });
              },
            ),
            Visibility(
              visible: myList.length >= 1,
              replacement:
                  Text("searching", style: TextStyle(color: Colors.white)),
              child: ScaledList(
                itemBuilder: (int index, int selectedIndex) {
                  final Movie myMovie = myList[index];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: selectedIndex == index ? 100 : 80,
                        child: Image.network(myMovie.poster!),
                      ),
                      SizedBox(height: 15),
                      Text(
                        myMovie.title!,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: selectedIndex == index ? 25 : 20),
                      )
                    ],
                  );
                },
                itemCount: myList.length,
                itemColor: (int index) {
                  return Colors.orange;
                },
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                Movie mv = await getMovieById('tt0304141');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MovieScreen(mv)),
                );
              },
              child: Text('movie'),
            ),
          ],
        ),
      ),
    );
  }
}

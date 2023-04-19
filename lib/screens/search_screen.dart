import 'package:flutter/material.dart';
import 'package:movie_app/networking.dart';
import 'package:movie_app/service/movie.dart';
import 'package:scaled_list/scaled_list.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSearchList('harry');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ElevatedButton(onPressed: (){
              setState(() async {
                Movie mv =  await getMovieById(test);
                print(mv.year);
              });
            }, child: Text('test')),
            TextField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  // icon: Icon(Icons.search,color: Colors.white,),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(20),
                  )),
              onChanged: (value) {},
            ),
            ScaledList(
              itemBuilder: (int index, int selectedIndex) {
                final category = categories[index];
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: selectedIndex == index ? 100 : 80,
                      //child: Image.asset(category.image),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'name',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: selectedIndex == index ? 25 : 20),
                    )
                  ],
                );
              },
              itemCount: 0,
              itemColor: (int index) {
                return Colors.orange;
              },
            ),
          ],
        ),
      ),
    );
  }
}
final List<Movie> categories = [];

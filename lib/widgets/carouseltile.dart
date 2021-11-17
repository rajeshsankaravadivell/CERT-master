import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

final List<Widget> imageSliders = imgList
    .map((item) => Padding(
      padding: const EdgeInsets.all(4),
      child: Material(
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
  elevation: 5,
  child: Container(
      margin: const EdgeInsets.all(4),
      child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(18)),
          child: Stack(
            children: <Widget>[
              Image.network(item, fit: BoxFit.cover, width: 1000.0),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(200, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0)
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  child: Text(
                    'No. ${imgList.indexOf(item)} image',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          )),
  ),
),
    ))
    .toList();



final List<String> imgList = [
  'https://img.freepik.com/free-vector/coronavirus-safety-advice-social-distancing_145666-653.jpg?size=626&ext=jpg',
  'https://image.freepik.com/free-vector/stay-home-stop-coronavirus-design-with-falling-covid-19-virus-cell-light-background-vector-2019-ncov-corona-virus-outbreak-illustration-stay-safe-wash-hand-distancing_1314-2713.jpg',
  'https://img.freepik.com/free-vector/prevent-epidemic-rebound-concept-illustration_114360-3008.jpg?size=626&ext=jpg',
  'http://nshsdenebola.com/wp-content/uploads/2020/05/design-community-concept-illustration_114360-1244.jpg',
  'https://img.freepik.com/free-vector/avoid-coronavirus-transmission-by-touching-face-using-your-hands_152995-117.jpg?size=626&ext=jpg',
  'https://images.squarespace-cdn.com/content/v1/5af8964350a54f8953f49f76/1588352346769-Z4N3FAA22UX9Q0462V8K/ke17ZwdGBToddI8pDm48kEqe6umt3wNhpcc8nDuTgdEUqsxRUqqbr1mOJYKfIPR7LoDQ9mXPOjoJoqy81S2I8N_N4V1vUb5AoIIIbLZhVYxCRW4BPu10St3TBAUQYVKc52XC1b42ktSkbHvwZ0rp0W2XZrrZ2NpBu95h_1yZFG_XF6_c-av07vbVOl7yUMXu/Covid+safety+protocols+at+BOCO+Dental?format=1500w'
];



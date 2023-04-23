import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sandbox_flutter/widgets/footer.dart';
import 'package:sandbox_flutter/widgets/header.dart';
import 'package:sandbox_flutter/widgets/star_rating.dart';

class RateReview extends StatefulWidget {
  final travalsName;
  final startPlace;
  final startcity;
  final endplace;
  final endcity;
  final ticketId;

  const RateReview(
      {super.key,
      required this.travalsName,
      required this.endcity,
      required this.endplace,
      required this.startPlace,
      required this.startcity,
      required this.ticketId});

  @override
  State<RateReview> createState() => _RateReviewState();
}

class _RateReviewState extends State<RateReview> {
  int rating = 0;
  final ConfettiController _controllerBottomCenter = ConfettiController();

  void initState() {
    super.initState();
    _controllerBottomCenter.play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: SafeArea(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.all(5.0),
                      color: Color(0xFF235449),
                      child: Header()),

                  //body
                  Container(
                    margin: new EdgeInsets.symmetric(horizontal: 190.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 18.0, bottom: 18.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Rate and Review Your Trip",
                                  style: TextStyle(
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold)),
                              Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "With " + widget.travalsName,
                                    style: TextStyle(
                                      fontSize: 17,
                                    ),
                                  ))
                            ],
                          ),
                        ),

                        //Rating Card
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Card(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 38.0, top: 25, bottom: 20),
                                        child: Text(
                                          "Rate your  Experience",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17.0),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 25.0, top: 18, bottom: 25),
                                        child: StarRating(
                                          onChanged: (index) {
                                            if (index == 0) return;
                                            setState(() {
                                              rating = index;
                                            });
                                          },
                                          value: rating,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    width: 500,
                                    decoration: BoxDecoration(
                                      border: Border(
                                        top: BorderSide(
                                          width: 1.0,
                                          color: Colors.grey,
                                          style: BorderStyle.solid,
                                        ),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(30.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Add Detailed Review",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17.0),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 28.0),
                                            child: Container(
                                              // height: 150,

                                              child: TextFormField(
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          vertical: 100),
                                                  hintText: '',
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          const BorderRadius
                                                                  .all(
                                                              Radius.circular(
                                                                  7))),
                                                ),
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return 'Please enter your Details.';
                                                  }
                                                  return null;
                                                },
                                              ),
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(18.0),
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                  
                                                    showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return Container(
                                                          child: AlertDialog(
                                                            icon: Image.asset(
                                                              "assets/sucess_icon.png",
                                                            ),
                                                            title: Text(
                                                                "Glad you Like it"),
                                                            content: Container(
                                                              width: 50,
                                                              height: 50,
                                                              child: Card(
                                                                child: Column(
                                                                  children: [
                                                                    Text(
                                                                        "Points"),
                                                                    Text("20"),
                                                                    ConfettiWidget(
                                                                        confettiController:
                                                                            _controllerBottomCenter,
                                                                        blastDirection:
                                                                            -pi /
                                                                                2,
                                                                        emissionFrequency:
                                                                            0.01,
                                                                        numberOfParticles:
                                                                            80,
                                                                        maxBlastForce:
                                                                            100,
                                                                        minBlastForce:
                                                                            80,
                                                                        shouldLoop:
                                                                            false,
                                                                        blastDirectionality:
                                                                            BlastDirectionality
                                                                                .explosive,
                                                                        gravity:
                                                                            0.3),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                                child: Text(
                                                                    "Close"),
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                  child: Text(
                                                    'Submit ',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 23.0),
                                                  ),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Color.fromARGB(
                                                        255, 230, 151, 6),
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal: 30,
                                                        vertical:
                                                            30), // set the background color
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              40), // set the rounded corners
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            //Trip Summary Card

                            Container(
                              width: 500,
                              child: Card(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 30.0, right: 30.0, left: 30.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Trip Summary",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 18.0),
                                              child: Text("TICKET ID:" +
                                                  widget.ticketId),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 30.0,
                                            right: 30.0,
                                            left: 30.0),
                                        child: Container(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 130.0, top: 18.0),
                                                child: Container(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        widget.startPlace,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 18),
                                                      ),
                                                      Text(widget.startcity),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 130.0, top: 18.0),
                                                child: Container(
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                        widget.endplace,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 18),
                                                      ),
                                                      Text(widget.endplace),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 30.0,
                                            right: 30.0,
                                            left: 30.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border(
                                              top: BorderSide(
                                                width: 1.0,
                                                color: Colors.grey,
                                                style: BorderStyle.solid,
                                              ),
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 130.0, top: 18.0),
                                                child: Container(
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                          "Wednesday, 19-April-2023"),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 70.0, top: 18.0),
                                                child: Container(
                                                  child: Column(
                                                    children: [
                                                      Text("6:37 PM"),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 30.0,
                                            right: 30.0,
                                            left: 30.0),
                                        child: Container(
                                          width: 475.0,
                                          decoration: BoxDecoration(
                                            border: Border(
                                              top: BorderSide(
                                                width: 1.0,
                                                color: Colors.grey,
                                                style: BorderStyle.solid,
                                              ),
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 130.0, top: 18.0),
                                                child: Container(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        widget.travalsName,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 18),
                                                      ),
                                                      Text("Seat 2D")
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ]),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: Container(color: Color(0xFF235449), child: Footer()),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

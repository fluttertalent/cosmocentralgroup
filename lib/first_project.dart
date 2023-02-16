import 'package:flutter/material.dart';

class FirstProject extends StatefulWidget {
  const FirstProject({Key? key}) : super(key: key);

  @override
  State<FirstProject> createState() => _FirstProjectState();
}

class _FirstProjectState extends State<FirstProject> {
  int index = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          Stack(
            //alignment:Alignment.center,
            children: [
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0)),
                  color: Colors.lightGreen,
                ),
                height: 300,
                width: double.infinity,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.menu,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 80,
                          ),
                          Text(
                            "Here is some Text",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                //   top: 30,
                child: Padding(
                  padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
                  child: Container(
                    height: 700,
                    width: double.infinity,
                    color: Colors.lightGreen,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    index = 1;
                                  });
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20.0),
                                          topRight: Radius.circular(20.0)),
                                      color: index == 0
                                          ? Colors.green
                                          : Colors.white,
                                    ),
                                    // color: Colors.red,
                                    height: 60,
                                    //  width: 150,
                                    child: Center(
                                        child: Text(
                                      'Buy',
                                      style: TextStyle(
                                        color: index == 0
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ))),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    index = 0;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20.0),
                                        topRight: Radius.circular(20.0)),
                                    color: index == 1
                                        ? Colors.green
                                        : Colors.white,
                                  ),
                                  //    color: Colors.blue,
                                  height: 60,
                                  // width: 150,
                                  child: Center(
                                    child: Text(
                                      'Sell',
                                      style: TextStyle(
                                        color: index == 0
                                            ? Colors.black
                                            : Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        // SizedBox(height: 1,),
                        index == 0
                            ? Container(
                                color: Colors.yellow,
                                height: 50,
                                width: 70,
                              )
                            : Container(),
                        index == 1
                            ? Container(
                                color: Colors.white,
                                height: 640,
                                width: double.infinity,
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 14,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                color: Colors.grey
                                                    .withOpacity(0.2)),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 6.0, vertical: 3),
                                            child: Text(
                                              'Clothes',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                color: Colors.grey
                                                    .withOpacity(0.2)),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 6.0, vertical: 3),
                                            child: Text(
                                              'Shoes',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                color: Colors.grey
                                                    .withOpacity(0.2)),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 6.0, vertical: 3),
                                            child: Text(
                                              'Glasses',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                color: Colors.grey
                                                    .withOpacity(0.2)),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 6.0, vertical: 3),
                                            child: Text(
                                              'food',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                color: Colors.grey
                                                    .withOpacity(0.2)),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 6.0, vertical: 3),
                                            child: Text(
                                              'mobiles',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        const SizedBox(
                                          width: 23,
                                        ),
                                        Row(
                                          children: [
                                            Text('Rewards',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                            Icon(
                                              Icons.keyboard_arrow_down,
                                              color: Colors.grey,
                                              size: 15,
                                            )
                                          ],
                                        ),
                                        Spacer(),
                                        Row(
                                          children: [
                                            Text('Discounts',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                            Icon(
                                              Icons.keyboard_arrow_down,
                                              color: Colors.grey,
                                              size: 15,
                                            )
                                          ],
                                        ),
                                        Spacer(),
                                        const SizedBox(
                                          height: 12,
                                        ),
                                        Row(
                                          children: [
                                            Text('Prizes',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                            Icon(
                                              Icons.keyboard_arrow_down,
                                              color: Colors.grey,
                                              size: 15,
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 23,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 17,
                                    ),
                                    ListView.separated(
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding:
                                                const EdgeInsets.only(top: 8.0),
                                            child: Row(
                                              children: [
                                                const SizedBox(
                                                  width: 14,
                                                ),
                                                Column(
                                                  children: [
                                                    Text(
                                                      '\$12000',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 14),
                                                    ),
                                                    Text(
                                                      '',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 14),
                                                    ),
                                                  ],
                                                ),
                                                Spacer(),
                                                Column(
                                                  children: [
                                                    Text(
                                                      'Iphone is on discounted prize',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 14),
                                                    ),
                                                    Text(
                                                      'discount',
                                                      style: TextStyle(
                                                          color: Colors.black38,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 14),
                                                    ),
                                                  ],
                                                ),
                                                Spacer(),
                                                Column(
                                                  children: [
                                                    Text(
                                                      '12/3/22',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Colors.green,
                                                          fontSize: 14),
                                                    ),
                                                    Text(
                                                      '12:15pm',
                                                      style: TextStyle(
                                                          color: Colors.black38,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 14),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  width: 14,
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                        separatorBuilder: (context, index) =>
                                            Divider(
                                              color:
                                                  Colors.grey.withOpacity(0.7),
                                            ),
                                        itemCount: 6),
                                    const SizedBox(
                                      height: 35,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width -
                                          60,
                                      height: 80,
                                      decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                    ),
                                  ],
                                ))
                            : Container(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}

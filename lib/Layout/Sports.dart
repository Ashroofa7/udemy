import 'package:flutter/material.dart';

class Sports extends StatelessWidget {
  const Sports({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  15,
                ),
                image: DecorationImage(
                    image: NetworkImage(
                        'https://image.shutterstock.com/image-photo/business-woman-drawing-global-structure-260nw-1006041130.jpg'),
                    fit: BoxFit.cover),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Container(
                  height: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 115,
                        child: Text(
                          'styke',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          maxLines: 4,
                          overflow: TextOverflow.visible,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'data',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:zyluinternship/emp.dart';

class EmpList extends StatelessWidget {
  const EmpList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: EmpModel.items.length,
        itemBuilder: (context, index) {
          final employee = EmpModel.items[index];
          return InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Container()
                  //  HomeDetailPage(
                  //   catelog: catelog,
                  // ),
                  ),
            ),
            child: EmpItem(
              emp: employee,
            ),
          );
        },
      ),
    );
  }
}


class EmpItem extends StatelessWidget {
  final Item emp;
  const EmpItem({Key? key, required this.emp}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var children2 = [
      Hero(
        tag: Key(emp.id.toString()),
        child: EmpImage(
          image: emp.image,
        ),
      ),
      Expanded(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("My Name is " + emp.name),
          const SizedBox(
            height: 10,
          ),
          ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            buttonPadding: EdgeInsets.zero,
            children: [
              Text("I have " + emp.exp.toString() + " years of experiance"),
               Padding(
                padding:  EdgeInsets.all(5.0),
                child: Icon(Icons.circle,color: emp.exp>=5 ? Colors.green : Colors.red)
              )
              // Text(emp.name),
              // AddToCart(catelog: catelog)
            ],
          ),
        ],
      ))
    ];
    return Container(
        child: Row(
      children: children2,
    ));
  }
}

class EmpImage extends StatelessWidget {
  final String image;

  const EmpImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        radius: 80,
        backgroundColor: Colors.white,
        child:  Image.network(
        image,fit: BoxFit.cover,
      )
      ),
    );
  }
}

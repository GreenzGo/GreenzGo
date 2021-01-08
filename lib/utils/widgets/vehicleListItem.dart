import 'package:flutter/material.dart';

class _VehicleDescription extends StatelessWidget {
  _VehicleDescription({
    this.title,
    this.location,
    this.price,
    this.rating,
  });
  final String title;
  final String location;
  final String price;
  final String rating;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '$title',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const Padding(
                    padding: EdgeInsets.only(
                  bottom: 8,
                )),
                Text(
                  '$location',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 10.0,
                    color: Colors.grey,
                  ),
                ),
                const Padding(
                    padding: EdgeInsets.only(
                  bottom: 8,
                )),
                Row(
                  children: [
                    Text(
                      'Rating: $rating',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                    Icon(
                      Icons.star_rate_rounded,
                      size: 16,
                      color: Color(0xff57BA98),
                    ),
                  ],
                ),
                const Padding(
                    padding: EdgeInsets.only(
                  bottom: 8,
                )),
                Text(
                  '\$ $price /day',
                  style: const TextStyle(
                    fontSize: 10.0,
                  ),
                ),
                const Padding(
                    padding: EdgeInsets.only(
                  bottom: 8,
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class VehicleListItem extends StatelessWidget {
  VehicleListItem({
    this.onPress,
    this.onTap,
    this.thumbnail,
    this.title,
    this.location,
    this.price,
    this.rating,
  });

  final Function onPress;
  final Function onTap;
  final Widget thumbnail;
  final String title;
  final String location;
  final String price;
  final String rating;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: SizedBox(
        height: 140,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              color: Color(0xff2a2a2a),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: thumbnail,
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 2, 0),
                    child: _VehicleDescription(
                      title: title,
                      location: location,
                      price: price,
                      rating: rating,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: null,
                  iconSize: 32,
                  icon: Icon(Icons.more_vert_rounded),
                  color: Color(0xff57BA98),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

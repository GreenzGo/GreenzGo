import 'package:flutter/material.dart';
import 'package:greenz_go_app_v2/api/greenz_go_api.dart';
import 'package:greenz_go_app_v2/constants.dart';
import 'package:greenz_go_app_v2/notifier/auth_notifier.dart';
import 'package:greenz_go_app_v2/notifier/vehicle_notifier.dart';
import 'package:greenz_go_app_v2/ui/screens/vehicle_detail.dart';
import 'package:greenz_go_app_v2/utils/widgets/reusableCard.dart';
import 'package:greenz_go_app_v2/utils/widgets/vehicleListItem.dart';
import 'package:provider/provider.dart';

//TODO:#6 Refactor card to be able to generate a list view

class CatalogScreen extends StatefulWidget {
  static const String id = 'catalog_screen';

  @override
  _CatalogScreenState createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    VehicleNotifier vehicleNotifier =
        Provider.of<VehicleNotifier>(context, listen: false);
    getVehicles(vehicleNotifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AuthNotifier authNotifier =
        Provider.of<AuthNotifier>(context, listen: false);
    VehicleNotifier vehicleNotifier = Provider.of<VehicleNotifier>(context);

    super.build(context);
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/background_image_2.png'),
              fit: BoxFit.cover),
        ),
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Catalog",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 36,
                color: kTextColor,
              ),
            ),
            actions: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.filter_list,
                      size: 30,
                      color: Color(0xff57ba98),
                    ),
                    onPressed: () {},
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.filter_none,
                      size: 25,
                      color: Color(0xff57ba98),
                    ),
                    onPressed: () {},
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                ],
              ),
            ],
            elevation: 0,
          ),
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.only(
              left: 10,
              top: 15,
              right: 10,
            ),
            child: ListView.separated(
              itemCount: vehicleNotifier.vehicleList.length,
              padding: EdgeInsets.all(10),
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 15, left: 10, bottom: 15),
                          child: Text(
                            "${vehicleNotifier.vehicleList.length}",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: kTextColor,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 15, bottom: 15, left: 10),
                          child: Text(
                            "Results found",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: Color(0xffb5cfd2),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: VehicleListItem(
                        onTap: () {
                          vehicleNotifier.currentVehicle =
                              vehicleNotifier.vehicleList[index];
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) {
                            return VehicleDetail();
                          }));
                        },
                        thumbnail: SizedBox.expand(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.asset(
                              'images/car.jpg',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        title:
                            '${vehicleNotifier.vehicleList[index].vehicleMake} ${vehicleNotifier.vehicleList[index].vehicleModel}',
                        location:
                            vehicleNotifier.vehicleList[index].rentalAddress,
                        rating: vehicleNotifier.vehicleList[index].rating
                            .toString(),
                        price: vehicleNotifier.vehicleList[index].vehicleRate
                            .toString(),
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  height: 20,
                  thickness: 2,
                  indent: 10,
                  endIndent: 10,
                  color: Color(0xff57BA98),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
// ReusableCard(
// onPress: () {},
// colour: Color(0xff2a2a2a),
// cardHeight: 130,
// cardWidth: 360,
// borderRadius: BorderRadius.only(
// topLeft: Radius.circular(30),
// bottomLeft: Radius.circular(30),
// bottomRight: Radius.circular(30),
// ),
// cardChild: ListTile(
// contentPadding: EdgeInsets.symmetric(
// vertical: 15, horizontal: 10),
// leading: ClipRRect(
// borderRadius: BorderRadius.circular(30),
// child: Image.asset(
// 'images/car.jpg',
// fit: BoxFit.cover,
// width: 100,
// height: 250,
// ),
// ),
// trailing: IconButton(
// onPressed: () {},
// iconSize: 32,
// icon: Icon(Icons.more_vert_rounded),
// color: Color(0xff57BA98),
// ),
// title: Padding(
// padding: const EdgeInsets.only(
// top: 8,
// bottom: 8,
// ),
// child: Text(
// '${vehicleNotifier.vehicleList[index].vehicleMake} ${vehicleNotifier.vehicleList[index].vehicleModel}',
// style:
// TextStyle(color: Colors.white, fontSize: 16),
// textAlign: TextAlign.center,
// ),
// ),
// subtitle: Column(
// children: [
// Padding(
// padding: const EdgeInsets.only(
// bottom: 8,
// ),
// child: Text(
// vehicleNotifier
//     .vehicleList[index].rentalAddress,
// style: TextStyle(
// color: Colors.grey,
// fontSize: 12,
// ),
// ),
// ),
// Padding(
// padding: const EdgeInsets.only(
// bottom: 8,
// ),
// child: Text(
// '\$ ${vehicleNotifier.vehicleList[index].vehicleRate} /day',
// style: TextStyle(
// fontSize: 12,
// ),
// ),
// ),
// ],
// ),
// ),
// )

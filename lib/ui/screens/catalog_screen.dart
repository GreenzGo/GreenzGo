import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:greenz_go_app_v2/api/greenz_go_api.dart';
import 'package:greenz_go_app_v2/constants.dart';
import 'package:greenz_go_app_v2/notifier/auth_notifier.dart';
import 'package:greenz_go_app_v2/notifier/vehicle_notifier.dart';
import 'package:greenz_go_app_v2/ui/screens/vehicle_detail.dart';
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
    vehicleNotifier.vehicleList != null
        ? getVehicles(vehicleNotifier)
        : Center(
            child: CircularProgressIndicator(
              semanticsLabel: 'Loading Vehicles',
            ),
          );
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
            backgroundColor: Colors.transparent,
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
          body: Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.fromLTRB(5, 0, 5, 10),
            child: ListView.separated(
              itemCount: vehicleNotifier.vehicleList.length,
              padding: EdgeInsets.all(10),
              itemBuilder: (BuildContext context, int index) {
                print('building listview');
                return Column(
                  children: [
                    VehicleListItem(
                      onTap: () {
                        vehicleNotifier.currentVehicle =
                            vehicleNotifier.vehicleList[index];
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context) {
                          return VehicleDetail();
                        }));
                      },
                      thumbnail: SizedBox.expand(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: CachedNetworkImage(
                            imageUrl: vehicleNotifier.vehicleList[index].image,
                            imageBuilder: (context, imageProvider) => ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image(
                                image: imageProvider,
                                fit: BoxFit.fill,
                              ),
                            ),
                            placeholder: (context, url) =>
                                CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                      ),
                      title:
                          '${vehicleNotifier.vehicleList[index].vehicleMake} ${vehicleNotifier.vehicleList[index].vehicleModel}',
                      location:
                          vehicleNotifier.vehicleList[index].rentalAddress,
                      rating:
                          vehicleNotifier.vehicleList[index].rating.toString(),
                      price: vehicleNotifier.vehicleList[index].vehicleRate
                          .toString(),
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

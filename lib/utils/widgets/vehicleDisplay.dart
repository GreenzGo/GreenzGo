import 'package:flutter/material.dart';

// class vehicleDisplay extends StatelessWidget {
//   vehicleDisplay({
//     Key key,
//   }) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: <Widget>[
//         Pinned.fromSize(
//           bounds: Rect.fromLTWH(0.0, 0.0, 370.0, 290.0),
//           size: Size(370.0, 420.0),
//           pinLeft: true,
//           pinRight: true,
//           pinTop: true,
//           pinBottom: true,
//           child:
//               // Adobe XD layer: 'Vehicle_image' (group)
//               Stack(
//             children: <Widget>[
//               Pinned.fromSize(
//                 bounds: Rect.fromLTWH(0.0, 0.0, 370.0, 290.0),
//                 size: Size(370.0, 290.0),
//                 pinLeft: true,
//                 pinRight: true,
//                 pinTop: true,
//                 pinBottom: true,
//                 child:
//                     // Adobe XD layer: 'image_container' (shape)
//                     Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(50.0),
//                       topRight: Radius.circular(50.0),
//                     ),
//                     border:
//                         Border.all(width: 7.0, color: const Color(0xff57ba98)),
//                   ),
//                 ),
//               ),
//               Pinned.fromSize(
//                 bounds: Rect.fromLTWH(5.0, 5.0, 360.0, 280.0),
//                 size: Size(370.0, 290.0),
//                 pinLeft: true,
//                 pinRight: true,
//                 pinTop: true,
//                 pinBottom: true,
//                 child:
//                     // Adobe XD layer: 'vehicle_image' (shape)
//                     Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(50.0),
//                       topRight: Radius.circular(50.0),
//                     ),
//                     image: DecorationImage(
//                       image: const AssetImage(''),
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Pinned.fromSize(
//           bounds: Rect.fromLTWH(0.0, 290.0, 185.0, 65.0),
//           size: Size(370.0, 420.0),
//           pinLeft: true,
//           fixedWidth: true,
//           fixedHeight: true,
//           child:
//               // Adobe XD layer: 'Vehicle_Short_Info' (group)
//               Stack(
//             children: <Widget>[
//               Pinned.fromSize(
//                 bounds: Rect.fromLTWH(60.0, -60.0, 65.0, 185.0),
//                 size: Size(185.0, 65.0),
//                 pinLeft: true,
//                 pinRight: true,
//                 pinTop: true,
//                 pinBottom: true,
//                 child: Transform.rotate(
//                   angle: -1.5708,
//                   child:
//                       // Adobe XD layer: 'short_info_container' (shape)
//                       Container(
//                     decoration: BoxDecoration(
//                       color: const Color(0xff57ba98),
//                     ),
//                   ),
//                 ),
//               ),
//               Pinned.fromSize(
//                 bounds: Rect.fromLTWH(101.1, 13.0, 37.0, 40.0),
//                 size: Size(185.0, 65.0),
//                 fixedWidth: true,
//                 fixedHeight: true,
//                 child:
//                     // Adobe XD layer: 'rating_info' (group)
//                     Stack(
//                   children: <Widget>[
//                     Pinned.fromSize(
//                       bounds: Rect.fromLTWH(0.0, 0.0, 37.0, 16.0),
//                       size: Size(37.0, 40.0),
//                       pinLeft: true,
//                       pinRight: true,
//                       pinTop: true,
//                       fixedHeight: true,
//                       child:
//                           // Adobe XD layer: 'label' (text)
//                           Text(
//                         'Rating',
//                         style: TextStyle(
//                           fontFamily: 'Segoe UI',
//                           fontSize: 12,
//                           color: const Color(0xff121212),
//                           fontWeight: FontWeight.w700,
//                         ),
//                         textAlign: TextAlign.left,
//                       ),
//                     ),
//                     Pinned.fromSize(
//                       bounds: Rect.fromLTWH(5.0, 16.0, 26.0, 24.0),
//                       size: Size(37.0, 40.0),
//                       pinLeft: true,
//                       pinBottom: true,
//                       fixedWidth: true,
//                       fixedHeight: true,
//                       child:
//                           // Adobe XD layer: 'rating_number' (text)
//                           Text(
//                         '3.2',
//                         style: TextStyle(
//                           fontFamily: 'Segoe UI',
//                           fontSize: 18,
//                           color: const Color(0xfff2f2f2),
//                           fontWeight: FontWeight.w700,
//                         ),
//                         textAlign: TextAlign.left,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Pinned.fromSize(
//                 bounds: Rect.fromLTWH(46.1, 17.5, 30.0, 30.0),
//                 size: Size(185.0, 65.0),
//                 fixedWidth: true,
//                 fixedHeight: true,
//                 child:
//                     // Adobe XD layer: 'Icon material-stars' (shape)
//                     SvgPicture.string(
//                   _svg_osd9f3,
//                   allowDrawingOutsideViewBox: true,
//                   fit: BoxFit.fill,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Pinned.fromSize(
//           bounds: Rect.fromLTWH(185.0, 290.0, 185.0, 65.0),
//           size: Size(370.0, 420.0),
//           pinRight: true,
//           fixedWidth: true,
//           fixedHeight: true,
//           child:
//               // Adobe XD layer: 'Vehicle_Short_Info' (group)
//               Stack(
//             children: <Widget>[
//               Pinned.fromSize(
//                 bounds: Rect.fromLTWH(60.0, -60.0, 65.0, 185.0),
//                 size: Size(185.0, 65.0),
//                 pinLeft: true,
//                 pinRight: true,
//                 pinTop: true,
//                 pinBottom: true,
//                 child: Transform.rotate(
//                   angle: -1.5708,
//                   child:
//                       // Adobe XD layer: 'short_info_container' (shape)
//                       Container(
//                     decoration: BoxDecoration(
//                       color: const Color(0xff57ba98),
//                     ),
//                   ),
//                 ),
//               ),
//               Pinned.fromSize(
//                 bounds: Rect.fromLTWH(95.0, 13.0, 41.0, 40.0),
//                 size: Size(185.0, 65.0),
//                 fixedWidth: true,
//                 fixedHeight: true,
//                 child:
//                     // Adobe XD layer: 'rating_info' (group)
//                     Stack(
//                   children: <Widget>[
//                     Pinned.fromSize(
//                       bounds: Rect.fromLTWH(5.0, 0.0, 30.0, 16.0),
//                       size: Size(41.0, 40.0),
//                       pinLeft: true,
//                       pinRight: true,
//                       pinTop: true,
//                       fixedHeight: true,
//                       child:
//                           // Adobe XD layer: 'label' (text)
//                           Text(
//                         'Drive',
//                         style: TextStyle(
//                           fontFamily: 'Segoe UI',
//                           fontSize: 12,
//                           color: const Color(0xff121212),
//                           fontWeight: FontWeight.w700,
//                         ),
//                         textAlign: TextAlign.left,
//                       ),
//                     ),
//                     Pinned.fromSize(
//                       bounds: Rect.fromLTWH(0.0, 16.0, 41.0, 24.0),
//                       size: Size(41.0, 40.0),
//                       pinLeft: true,
//                       pinRight: true,
//                       pinBottom: true,
//                       fixedHeight: true,
//                       child:
//                           // Adobe XD layer: 'rating_number' (text)
//                           Text(
//                         'Auto',
//                         style: TextStyle(
//                           fontFamily: 'Segoe UI',
//                           fontSize: 18,
//                           color: const Color(0xfff2f2f2),
//                           fontWeight: FontWeight.w700,
//                         ),
//                         textAlign: TextAlign.left,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Pinned.fromSize(
//                 bounds: Rect.fromLTWH(48.8, 20.5, 27.0, 24.0),
//                 size: Size(185.0, 65.0),
//                 fixedWidth: true,
//                 fixedHeight: true,
//                 child:
//                     // Adobe XD layer: 'Icon material-direc…' (shape)
//                     SvgPicture.string(
//                   _svg_cxur2,
//                   allowDrawingOutsideViewBox: true,
//                   fit: BoxFit.fill,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Pinned.fromSize(
//           bounds: Rect.fromLTWH(0.0, 355.0, 185.0, 65.0),
//           size: Size(370.0, 420.0),
//           pinLeft: true,
//           pinBottom: true,
//           fixedWidth: true,
//           fixedHeight: true,
//           child:
//               // Adobe XD layer: 'Vehicle_Short_Info' (group)
//               Stack(
//             children: <Widget>[
//               Pinned.fromSize(
//                 bounds: Rect.fromLTWH(60.0, -60.0, 65.0, 185.0),
//                 size: Size(185.0, 65.0),
//                 pinLeft: true,
//                 pinRight: true,
//                 pinTop: true,
//                 pinBottom: true,
//                 child: Transform.rotate(
//                   angle: -1.5708,
//                   child:
//                       // Adobe XD layer: 'short_info_container' (shape)
//                       Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(21.0),
//                       ),
//                       color: const Color(0xff57ba98),
//                     ),
//                   ),
//                 ),
//               ),
//               Pinned.fromSize(
//                 bounds: Rect.fromLTWH(105.1, 13.0, 30.0, 40.0),
//                 size: Size(185.0, 65.0),
//                 fixedWidth: true,
//                 fixedHeight: true,
//                 child:
//                     // Adobe XD layer: 'rating_info' (group)
//                     Stack(
//                   children: <Widget>[
//                     Pinned.fromSize(
//                       bounds: Rect.fromLTWH(0.0, 0.0, 30.0, 16.0),
//                       size: Size(30.0, 40.0),
//                       pinLeft: true,
//                       pinRight: true,
//                       pinTop: true,
//                       fixedHeight: true,
//                       child:
//                           // Adobe XD layer: 'label' (text)
//                           Text(
//                         'Seats',
//                         style: TextStyle(
//                           fontFamily: 'Segoe UI',
//                           fontSize: 12,
//                           color: const Color(0xff121212),
//                           fontWeight: FontWeight.w700,
//                         ),
//                         textAlign: TextAlign.left,
//                       ),
//                     ),
//                     Pinned.fromSize(
//                       bounds: Rect.fromLTWH(10.0, 16.0, 10.0, 24.0),
//                       size: Size(30.0, 40.0),
//                       pinBottom: true,
//                       fixedWidth: true,
//                       fixedHeight: true,
//                       child:
//                           // Adobe XD layer: 'rating_number' (text)
//                           Text(
//                         '5',
//                         style: TextStyle(
//                           fontFamily: 'Segoe UI',
//                           fontSize: 18,
//                           color: const Color(0xfff2f2f2),
//                           fontWeight: FontWeight.w700,
//                         ),
//                         textAlign: TextAlign.left,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Pinned.fromSize(
//                 bounds: Rect.fromLTWH(51.1, 19.0, 30.0, 27.0),
//                 size: Size(185.0, 65.0),
//                 fixedWidth: true,
//                 fixedHeight: true,
//                 child:
//                     // Adobe XD layer: 'Icon material-event…' (shape)
//                     SvgPicture.string(
//                   _svg_wngey1,
//                   allowDrawingOutsideViewBox: true,
//                   fit: BoxFit.fill,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Pinned.fromSize(
//           bounds: Rect.fromLTWH(185.0, 355.0, 185.0, 65.0),
//           size: Size(370.0, 420.0),
//           pinRight: true,
//           pinBottom: true,
//           fixedWidth: true,
//           fixedHeight: true,
//           child:
//               // Adobe XD layer: 'Vehicle_Short_Info' (group)
//               Stack(
//             children: <Widget>[
//               Pinned.fromSize(
//                 bounds: Rect.fromLTWH(0.0, 0.0, 185.0, 65.0),
//                 size: Size(185.0, 65.0),
//                 pinLeft: true,
//                 pinRight: true,
//                 pinTop: true,
//                 pinBottom: true,
//                 child:
//                     // Adobe XD layer: 'short_info_container' (shape)
//                     SvgPicture.string(
//                   _svg_1q6sem,
//                   allowDrawingOutsideViewBox: true,
//                   fit: BoxFit.fill,
//                 ),
//               ),
//               Pinned.fromSize(
//                 bounds: Rect.fromLTWH(89.0, 13.0, 48.0, 40.0),
//                 size: Size(185.0, 65.0),
//                 fixedWidth: true,
//                 fixedHeight: true,
//                 child:
//                     // Adobe XD layer: 'rating_info' (group)
//                     Stack(
//                   children: <Widget>[
//                     Pinned.fromSize(
//                       bounds: Rect.fromLTWH(0.0, 0.0, 48.0, 16.0),
//                       size: Size(48.0, 40.0),
//                       pinLeft: true,
//                       pinRight: true,
//                       pinTop: true,
//                       fixedHeight: true,
//                       child:
//                           // Adobe XD layer: 'label' (text)
//                           Text(
//                         'Location',
//                         style: TextStyle(
//                           fontFamily: 'Segoe UI',
//                           fontSize: 12,
//                           color: const Color(0xff121212),
//                           fontWeight: FontWeight.w700,
//                         ),
//                         textAlign: TextAlign.left,
//                       ),
//                     ),
//                     Pinned.fromSize(
//                       bounds: Rect.fromLTWH(5.0, 16.0, 26.0, 24.0),
//                       size: Size(48.0, 40.0),
//                       pinLeft: true,
//                       pinBottom: true,
//                       fixedWidth: true,
//                       fixedHeight: true,
//                       child:
//                           // Adobe XD layer: 'rating_number' (text)
//                           Text(
//                         '3.2',
//                         style: TextStyle(
//                           fontFamily: 'Segoe UI',
//                           fontSize: 18,
//                           color: const Color(0xfff2f2f2),
//                           fontWeight: FontWeight.w700,
//                         ),
//                         textAlign: TextAlign.left,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Pinned.fromSize(
//                 bounds: Rect.fromLTWH(47.8, 18.5, 21.0, 30.0),
//                 size: Size(185.0, 65.0),
//                 fixedWidth: true,
//                 fixedHeight: true,
//                 child:
//                     // Adobe XD layer: 'Icon material-locat…' (shape)
//                     SvgPicture.string(
//                   _svg_xj8eg0,
//                   allowDrawingOutsideViewBox: true,
//                   fit: BoxFit.fill,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

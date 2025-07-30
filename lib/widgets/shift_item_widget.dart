// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:kingdom_care_services_app/models/shift.dart';

// import '../modules/helpers/get_random_color.dart';

// class ShiftItemWidget extends StatefulWidget {
//   final ShiftModel shift;
//   const ShiftItemWidget({super.key, required this.shift});

//   @override
//   State<ShiftItemWidget> createState() => _ShiftItemWidgetState();
// }

// class _ShiftItemWidgetState extends State<ShiftItemWidget> {
//   Color? shiftColor;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();

//     shiftColor = getRandomShiftColor();
//   }

//   @override
//   Widget build(BuildContext context) {
//     var day = DateFormat('d').format(widget.shift.startTime);
//     var month =
//         DateFormat(
//           'MMM',
//         ).format(widget.shift.startTime).toString().toUpperCase();
//     return Container(
//       height: 120,
//       width: double.infinity,

//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(15),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withValues(alpha: 0.1),
//             spreadRadius: 3.0,
//             blurRadius: 6.0,
//             offset: Offset(2, 3),
//           ),
//         ],
//       ),
//       child: Row(
//         children: [
//           _buildDateAndRateContainer(day: day, month: month),
//           SizedBox(width: 8),
//           Column(
//             children: [
//               Text(
//                 widget.shift.title,
//                 overflow: TextOverflow.ellipsis,
//                 style: Theme.of(
//                   context,
//                 ).textTheme.titleMedium!.copyWith(fontSize: 18),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Container _buildDateAndRateContainer({
//     required String day,
//     required String month,
//   }) {
//     return Container(
//       width: 90,
//       decoration: BoxDecoration(
//         // color: shiftColor,
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(15),
//           bottomLeft: Radius.circular(15),
//         ),
//       ),
//       child: Column(
//         children: [
//           Expanded(
//             child: Container(
//               width: 90,
//               decoration: BoxDecoration(
//                 color: shiftColor!,

//                 borderRadius: BorderRadius.only(topLeft: Radius.circular(15)),
//               ),
//               alignment: Alignment.center,
//               child: Text(
//                 "$day\n$month",
//                 textAlign: TextAlign.center,
//                 style: Theme.of(context).textTheme.titleMedium,
//               ),
//             ),
//           ),
//           Container(
//             height: 30,
//             width: 90,
//             decoration: BoxDecoration(
//               color: shiftColor!.withValues(alpha: 0.5),
//               borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15)),
//             ),
//             alignment: Alignment.center,

//             child: Text(
//               "£${widget.shift.rate}",
//               textAlign: TextAlign.center,
//               style: Theme.of(
//                 context,
//               ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

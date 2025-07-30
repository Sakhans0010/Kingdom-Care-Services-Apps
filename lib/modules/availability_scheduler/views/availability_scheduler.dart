// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// class AvailabilityScheduler extends StatefulWidget {
//   const AvailabilityScheduler({super.key});

//   @override
//   State<AvailabilityScheduler> createState() => _AvailabilitySchedulerState();
// }

// class _AvailabilitySchedulerState extends State<AvailabilityScheduler> {
//   DateTime currentMonth = DateTime.now();
//   bool isCurrentMonth = true;
//   Map<String, String> availability =
//       {}; // key: date string, value: Morning/Evening/Night

//   List<DateTime> getDatesInMonth(DateTime month) {
//     final now = DateTime.now();
//     final _isCurrentMonth = month.year == now.year && month.month == now.month;

//     final startDay = _isCurrentMonth ? now.day : 1;
//     final lastDay = DateTime(month.year, month.month + 1, 0);

//     return List.generate(
//       lastDay.day - startDay + 1,
//       (index) => DateTime(month.year, month.month, startDay + index),
//     );
//   }

//   void changeMonth(int offset) {
//     final newMonth = DateTime(currentMonth.year, currentMonth.month + offset);

//     final now = DateTime.now();
//     final todayMonth = DateTime(now.year, now.month);

//     setState(() {
//       currentMonth = newMonth;
//       isCurrentMonth =
//           newMonth.year == todayMonth.year &&
//           newMonth.month == todayMonth.month;
//     });
//   }

//   Widget buildAvailabilityRow(DateTime date) {
//     String dateKey = DateFormat('yyyy-MM-dd').format(date);
//     String? selectedTime = availability[dateKey];

//     return Row(
//       children: [
//         Expanded(child: Text(DateFormat('dd MMM').format(date))),
//         Expanded(
//           child: RadioListTile<String>(
//             value: 'Morning',
//             groupValue: selectedTime,
//             title: const Text(''),
//             onChanged: (value) {
//               setState(() {
//                 availability[dateKey] = value!;
//               });
//             },
//           ),
//         ),
//         Expanded(
//           child: RadioListTile<String>(
//             value: 'Evening',
//             groupValue: selectedTime,
//             title: const Text(''),
//             onChanged: (value) {
//               setState(() {
//                 availability[dateKey] = value!;
//               });
//             },
//           ),
//         ),
//         Expanded(
//           child: RadioListTile<String>(
//             value: 'U/A',
//             groupValue: selectedTime,
//             title: const Text(''),
//             onChanged: (value) {
//               setState(() {
//                 availability[dateKey] = value!;
//               });
//             },
//           ),
//         ),
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final dates = getDatesInMonth(currentMonth);
//     final monthLabel = DateFormat('MMMM yyyy').format(currentMonth);

//     return Scaffold(
//       appBar: AppBar(title: const Text('Availability Scheduler')),
//       body: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               IconButton(
//                 splashColor: isCurrentMonth ?  Colors.transparent : null,
//                 highlightColor: isCurrentMonth ?  Colors.transparent : null,
//                 icon: Icon(
//                   Icons.arrow_back,
//                   color: isCurrentMonth ? Colors.grey : Colors.black,
//                 ),
//                 onPressed: isCurrentMonth ? () {} : () => changeMonth(-1),
//               ),
//               Text(
//                 monthLabel,
//                 style: const TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               IconButton(
//                 icon: const Icon(Icons.arrow_forward),
//                 onPressed: () => changeMonth(1),
//               ),
//             ],
//           ),
//           const Divider(),
//           Padding(
//             padding: EdgeInsets.only(left: 15),
//             child: const Row(
//               children: [
//                 Expanded(
//                   child: Text(
//                     'Date',
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 Expanded(
//                   child: Text(
//                     'Morning',
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 Expanded(
//                   child: Text(
//                     'Evening',
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 Expanded(
//                   child: Align(
//                     // alignment: Alignment.center,
//                     child: Text(
//                       'U/A',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const Divider(),
//           Expanded(
//             child: ListView.builder(
//               itemCount: dates.length,
//               padding: EdgeInsets.only(left: 15),
//               itemBuilder: (context, index) =>
//                   buildAvailabilityRow(dates[index]),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// // import 'package:intl/intl.dart';

// class ShiftViewerScreen extends StatefulWidget {
//   final Map<String, String> availability;

//   const ShiftViewerScreen({super.key, required this.availability});

//   @override
//   State<ShiftViewerScreen> createState() => _ShiftViewerScreenState();
// }

// class _ShiftViewerScreenState extends State<ShiftViewerScreen> {
//   DateTime currentMonth = DateTime.now();
//   late List<DateTime> dates;
//   int selectedIndex = 0;

//   @override
//   void initState() {
//     super.initState();
//     dates = _getDates(currentMonth);
//   }

//   List<DateTime> _getDates(DateTime month) {
//     final first = DateTime(month.year, month.month, 1);
//     final last = DateTime(month.year, month.month + 1, 0);
//     return List.generate(
//       last.day,
//       (index) => DateTime(month.year, month.month, index + 1),
//     );
//   }

//   void changeMonth(int offset) {
//     setState(() {
//       currentMonth = DateTime(currentMonth.year, currentMonth.month + offset);
//       dates = _getDates(currentMonth);
//       selectedIndex = 0;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     String selectedDateStr = DateFormat(
//       'yyyy-MM-dd',
//     ).format(dates[selectedIndex]);
//     String? selectedShift = widget.availability[selectedDateStr];

//     return Scaffold(
//       appBar: AppBar(title: const Text('Available Shifts')),
//       body: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               IconButton(
//                 icon: const Icon(Icons.arrow_back),
//                 onPressed: () => changeMonth(-1),
//               ),
//               Text(
//                 DateFormat('MMMM yyyy').format(currentMonth),
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
//           SizedBox(
//             height: 60,
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: dates.length,
//               itemBuilder: (context, index) {
//                 final date = dates[index];
//                 final isSelected = index == selectedIndex;
//                 return GestureDetector(
//                   onTap: () => setState(() => selectedIndex = index),
//                   child: Container(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 10,
//                       vertical: 10,
//                     ),
//                     margin: const EdgeInsets.symmetric(
//                       horizontal: 5,
//                       vertical: 5,
//                     ),
//                     decoration: BoxDecoration(
//                       color: isSelected ? Colors.blue : Colors.grey[200],
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           DateFormat('E').format(date),
//                           style: TextStyle(
//                             color: isSelected ? Colors.white : Colors.black,
//                           ),
//                         ),
//                         Text(
//                           '${date.day}',
//                           style: TextStyle(
//                             color: isSelected ? Colors.white : Colors.black,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//           const SizedBox(height: 20),
//           Text(
//             selectedShift != null
//                 ? 'Available Shift: $selectedShift'
//                 : 'No shift available',
//             style: const TextStyle(fontSize: 20),
//           ),
//           const SizedBox(height: 20),
//           if (selectedShift != null)
//             ElevatedButton(
//               onPressed: () {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(
//                     content: Text(
//                       'Applied for $selectedShift shift on $selectedDateStr',
//                     ),
//                   ),
//                 );
//               },
//               child: const Text('Apply for Shift'),
//             ),
//         ],
//       ),
//     );
//   }
// }

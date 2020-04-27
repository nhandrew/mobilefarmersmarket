//  if (isIOS) {
//       return Padding(
//         padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 8.0),
//         child: CupertinoTextField(
//           keyboardType: TextInputType.emailAddress,
//           placeholder: 'email',
//           prefix: Padding(
//             padding: const EdgeInsets.only(left: 8.0),
//             child: Icon(
//               CupertinoIcons.mail_solid,
//               size: 35.0,
//               color: Color(0xFF48a1af),
//             ),
//           ),
//           placeholderStyle: GoogleFonts.roboto(
//             textStyle: TextStyle(color: Color(0xFFc8d6e5), fontSize: 14.0),
//           ),
//           cursorColor: Color(0xFF263a44),
//           style: GoogleFonts.roboto(
//               textStyle: TextStyle(
//                   color: Color(0xFF4e5b60),
//                   fontWeight: FontWeight.bold,
//                   fontSize: 16.0)),
//           textAlign: TextAlign.center,
//           decoration: BoxDecoration(
//             border: Border.all(color: Color(0xFFe2a84b), width: 2.0),
//             borderRadius: BorderRadius.circular(25.0),
//           ),
//           obscureText: (obscureText != null) ? obscureText : false,
//         ),
//       );
//     } else {
//       return Padding(
//         padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 8.0),
//         child: TextField(
//           keyboardType: TextInputType.emailAddress,
//           decoration: InputDecoration(
//             contentPadding: EdgeInsets.all(8.0),
//             hintText: hintText,
//             hintStyle: TextFieldStyles.placeholder(),
//             border: InputBorder.none,
//             prefixIcon: Padding(
//               padding: const EdgeInsets.only(left: 8.0),
//               child: Icon(
//                 Icons.email,
//                 size: 35.0,
//                 color: Color(0xFF48a1af),
//               ),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderSide: BorderSide(color: Color(0xFFe2a84b), width: 2.0),
//               borderRadius: BorderRadius.circular(25.0),
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderSide: BorderSide(color: Color(0xFFe2a84b), width: 2.0),
//               borderRadius: BorderRadius.circular(25.0),
//             ),
//           ),
//           cursorColor: Color(0xFF263a44),
//           style: GoogleFonts.roboto(
//               textStyle: TextStyle(
//                   color: Color(0xFF4e5b60),
//                   fontWeight: FontWeight.bold,
//                   fontSize: 16.0)),
//           textAlign: TextAlign.center,
//         ),
//       );
//     }
//   }
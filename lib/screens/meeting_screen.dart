import 'dart:math';

import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:unicons/unicons.dart';
// import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';
import 'package:kiraa/components/home_meeting_button.dart';
import 'package:kiraa/resources/jitsi_meet_method.dart';
// import 'package:kiraa/screens/video_call_screen.dart';


// class MeetingScreen extends StatefulWidget {
//   const MeetingScreen({super.key});
//
//   @override
//   State<MeetingScreen> createState() => _MeetingScreenState();
// }
//
// class _MeetingScreenState extends State<MeetingScreen> {
//   final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();
//
//   void createMeeting() async {
//     var random = Random();
//     String roomName = (random.nextInt(100000000) + 10000000).toString();
//     // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text));
//     // showSnackBar(context, 'Room Id: ${roomName}');
//     _jitsiMeetMethods.createNewMeeting(
//       roomName: roomName,
//       isAudioMuted: true,
//       isVideoMuted: true,
//     );
//   }

  // void joinMeeting(BuildContext context) {
  //   Navigator.pushNamed(context, VideoCallScreen.routeName);
  // }

class MeetingScreen extends StatelessWidget {
  MeetingScreen({Key? key}) : super(key: key);

  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();

  void createNewMeeting(BuildContext context) async {
    var random = Random();
    String roomName = (random.nextInt(100000000) + 100000000).toString();
    _jitsiMeetMethods.createMeeting(
      roomName: roomName,
      isAudioMuted: true,
      isVideoMuted: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 100),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            HomeMeetingButton(
              onPressed: () {
                Navigator.pushNamed(context, "/createNewMeeting");
    },
    // => createNewMeeting(context),
              text: 'New Meeting',
              icon: UniconsLine.video,
            ),
            HomeMeetingButton(
              onPressed: () {
                Navigator.pushNamed(context, "/video-call");
              },
              text: 'Join Meeting',
              icon: UniconsLine.plus_square,
            ),
          ],
        ),
        SizedBox(height: 70),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // HomeMeetingButton(
            //   onPressed: () {},
            //   text: 'Schedule',
            //   icon: UniconsLine.calendar_alt,
            // ),
            // HomeMeetingButton(
            //   onPressed: () {},
            //   text: 'Share Screen',
            //   icon: UniconsLine.export,
            // ),
          ],
        ),
        Expanded(
          child: Center(
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  "Create or Join Meetings with just a click!",
                  speed: Duration(milliseconds: 200),
                  cursor: "_",
                  textStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

//   @override
//   void dispose() {
//     JitsiMeet().hangUp();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             HomeMeetingButton(
//               onPressed: () {
//                 createMeeting();
//               },
//               icon: Icons.videocam,
//               label: 'Create Meeting',
//             ),
//             HomeMeetingButton(
//               onPressed: () {
//                 joinMeeting(context);
//               },
//
//               icon: Icons.add_box_rounded,
//               label: 'Join Meeting',
//             ),
//             // HomeMeetingButton(
//             //   onPressed: () {},
//             //   icon: Icons.calendar_today,
//             //   label: 'Schedule',
//             // ),
//             // HomeMeetingButton(
//             //   onPressed: () {},
//             //   icon: Icons.arrow_upward,
//             //   label: 'Share Screen',
//             // ),
//           ],
//         ),
//         const Expanded(
//           child: Center(
//             child: Text(
//               'Create/Join Meetings with just a tap!',
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//             ),
//           ),
//         ),
//         //
//       ],
//     );
//   }
// }
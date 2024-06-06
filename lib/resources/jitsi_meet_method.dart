import 'package:flutter/material.dart';
import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';


class JitsiMeetMethods {


  void createMeeting({required String roomName, required bool isAudioMuted, required bool isVideoMuted, String username = ''}) async {
    String name;
    if (username.isEmpty) {
      name: '';

    } else {
      name= username;
    }
    try {
      var jitsiMeet = JitsiMeet();
      var options = JitsiMeetConferenceOptions(
        serverURL: "https://meet.jit.si",
        room: roomName,
        configOverrides: {
          "startWithAudioMuted": isAudioMuted,
          "startWithVideoMuted": isVideoMuted,
          "subject": "Room Id: $roomName",
        },
        featureFlags: {
          FeatureFlags.unsafeRoomWarningEnabled: true,
          FeatureFlags.kickOutEnabled: true,
          FeatureFlags.liveStreamingEnabled: true,
          FeatureFlags.lobbyModeEnabled: true,
          FeatureFlags.calenderEnabled: true,
          FeatureFlags.resolution: FeatureFlagVideoResolutions.resolution720p,
          FeatureFlags.meetingPasswordEnabled: false,
          FeatureFlags.welcomePageEnabled: false,
          FeatureFlags.recordingEnabled: true,
          FeatureFlags.settingsEnabled: true,
          FeatureFlags.tileViewEnabled: true,},
        userInfo: JitsiMeetUserInfo(

        ),
      );

      jitsiMeet.join(options);
    } catch (e) {
      debugPrint('e: ${e}');
    }

    // JitsiMeetEventListener listener = JitsiMeetEventListener(
    JitsiMeetEventListener(
      conferenceJoined: (url) {
        debugPrint("conferenceJoined: url: $url");
      },
      participantJoined: (email, name, role, participantId) {
        debugPrint(
          "participantJoined: email: $email, name: $name, role: $role, "
              "participantId: $participantId",
        );
        // participants.add(participantId!);
      },
      chatMessageReceived: (senderId, message, isPrivate, timestamp) {
        debugPrint(
          "chatMessageReceived: senderId: $senderId, message: $message, "
              "isPrivate: $isPrivate",
        );
      },
      readyToClose: () {
        debugPrint("readyToClose");
      },
    );
  }
}
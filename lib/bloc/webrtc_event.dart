import 'package:freezed_annotation/freezed_annotation.dart';

part 'webrtc_event.freezed.dart';

@freezed
class WebRTCEvent with _$WebRTCEvent {
  const factory WebRTCEvent.initialize() = InitializeWebRTC;
  const factory WebRTCEvent.startCamera() = StartCamera;
  const factory WebRTCEvent.stopCamera() = StopCamera;
  const factory WebRTCEvent.createOffer() = CreateOffer;
  const factory WebRTCEvent.createAnswer({
    required String offer,
  }) = CreateAnswer;
  const factory WebRTCEvent.setRemoteDescription({
    required String sdp,
    required String type,
  }) = SetRemoteDescription;
  const factory WebRTCEvent.addIceCandidate({
    required String candidate,
    required String sdpMid,
    required int sdpMLineIndex,
  }) = AddIceCandidate;
} 
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

part 'webrtc_state.freezed.dart';

enum WebRTCStatus {
  initial,
  initializing,
  ready,
  connecting,
  connected,
  error
}

@freezed
class WebRTCState with _$WebRTCState {
  const factory WebRTCState({
    @Default(WebRTCStatus.initial) WebRTCStatus status,
    MediaStream? localStream,
    MediaStream? remoteStream,
    RTCPeerConnection? peerConnection,
    String? errorMessage,
    @Default(false) bool isCameraOn,
  }) = _WebRTCState;
} 
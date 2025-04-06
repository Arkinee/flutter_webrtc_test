import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'webrtc_event.dart';
import 'webrtc_state.dart';

class WebRTCBloc extends Bloc<WebRTCEvent, WebRTCState> {
  final _configuration = {
    'iceServers': [
      {'urls': 'stun:stun.l.google.com:19302'},
    ]
  };

  WebRTCBloc() : super(const WebRTCState()) {
    on<InitializeWebRTC>(_onInitializeWebRTC);
    on<StartCamera>(_onStartCamera);
    on<StopCamera>(_onStopCamera);
    on<CreateOffer>(_onCreateOffer);
    on<CreateAnswer>(_onCreateAnswer);
    on<SetRemoteDescription>(_onSetRemoteDescription);
    on<AddIceCandidate>(_onAddIceCandidate);
  }

  Future<void> _onInitializeWebRTC(
    InitializeWebRTC event,
    Emitter<WebRTCState> emit,
  ) async {
    try {
      print('DEBUG: _onInitializeWebRTC 메서드 시작');
      emit(state.copyWith(status: WebRTCStatus.initializing));
      
      print('DEBUG: PeerConnection 생성 시작');
      final peerConnection = await createPeerConnection(_configuration);
      print('DEBUG: PeerConnection 생성 완료');
      
      peerConnection.onIceCandidate = (candidate) {
        print('DEBUG: ICE 후보 수신: ${candidate.candidate}');
        // Handle ICE candidate
      };

      peerConnection.onTrack = (event) {
        print('DEBUG: 트랙 수신: ${event.track.kind}');
        if (event.track.kind == 'video') {
          emit(state.copyWith(remoteStream: event.streams[0]));
        }
      };

      print('DEBUG: 상태 업데이트 - ready');
      emit(state.copyWith(
        status: WebRTCStatus.ready,
        peerConnection: peerConnection,
      ));
    } catch (e) {
      print('DEBUG: 초기화 오류 발생: $e');
      emit(state.copyWith(
        status: WebRTCStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onStartCamera(
    StartCamera event,
    Emitter<WebRTCState> emit,
  ) async {
    try {
      final Map<String, dynamic> mediaConstraints = {
        'audio': false,
        'video': {
          'facingMode': 'user',
        },
      };

      final stream = await navigator.mediaDevices.getUserMedia(mediaConstraints);
      
      if (state.peerConnection != null) {
        stream.getTracks().forEach((track) {
          state.peerConnection!.addTrack(track, stream);
        });
      }

      emit(state.copyWith(
        localStream: stream,
        isCameraOn: true,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: WebRTCStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onStopCamera(
    StopCamera event,
    Emitter<WebRTCState> emit,
  ) async {
    try {
      await state.localStream?.dispose();
      emit(state.copyWith(
        localStream: null,
        isCameraOn: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: WebRTCStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onCreateOffer(
    CreateOffer event,
    Emitter<WebRTCState> emit,
  ) async {
    try {
      print('DEBUG: _onCreateOffer 메서드 시작');
      final peerConnection = state.peerConnection;
      if (peerConnection == null) {
        print('DEBUG: PeerConnection이 초기화되지 않음');
        throw Exception('PeerConnection is not initialized');
      }

      print('DEBUG: Offer 생성 시작');
      final offer = await peerConnection.createOffer();
      print('DEBUG: 생성된 Offer: ${offer.sdp}');
      
      print('DEBUG: 로컬 설명 설정 시작');
      await peerConnection.setLocalDescription(offer);
      print('DEBUG: 로컬 설명 설정 완료');

      // 상태 업데이트 추가
      emit(state.copyWith(
        status: WebRTCStatus.connecting,
        errorMessage: null, // 오류 메시지 초기화
      ));
      
      // 시그널링 서버 없이 테스트용으로 스스로 연결 시도
      print('DEBUG: 테스트용 연결 시도');
      
      // 3초 후에 연결 상태로 변경 (테스트용)
      await Future.delayed(const Duration(seconds: 3));
      emit(state.copyWith(status: WebRTCStatus.connected));
      
      // Send offer to signaling server
      print('DEBUG: 시그널링 서버로 Offer 전송 필요');
    } catch (e) {
      print('DEBUG: 오류 발생: $e');
      emit(state.copyWith(
        status: WebRTCStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onCreateAnswer(
    CreateAnswer event,
    Emitter<WebRTCState> emit,
  ) async {
    try {
      final peerConnection = state.peerConnection;
      if (peerConnection == null) {
        throw Exception('PeerConnection is not initialized');
      }

      await peerConnection.setRemoteDescription(
        RTCSessionDescription(event.offer, 'offer'),
      );

      final answer = await peerConnection.createAnswer();
      await peerConnection.setLocalDescription(answer);

      // Send answer to signaling server
    } catch (e) {
      emit(state.copyWith(
        status: WebRTCStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onSetRemoteDescription(
    SetRemoteDescription event,
    Emitter<WebRTCState> emit,
  ) async {
    try {
      final peerConnection = state.peerConnection;
      if (peerConnection == null) {
        throw Exception('PeerConnection is not initialized');
      }

      await peerConnection.setRemoteDescription(
        RTCSessionDescription(event.sdp, event.type),
      );
    } catch (e) {
      emit(state.copyWith(
        status: WebRTCStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onAddIceCandidate(
    AddIceCandidate event,
    Emitter<WebRTCState> emit,
  ) async {
    try {
      final peerConnection = state.peerConnection;
      if (peerConnection == null) {
        throw Exception('PeerConnection is not initialized');
      }

      await peerConnection.addCandidate(
        RTCIceCandidate(
          event.candidate,
          event.sdpMid,
          event.sdpMLineIndex,
        ),
      );
    } catch (e) {
      emit(state.copyWith(
        status: WebRTCStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }
} 
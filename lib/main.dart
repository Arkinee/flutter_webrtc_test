import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'bloc/webrtc_bloc.dart';
import 'bloc/webrtc_event.dart';
import 'bloc/webrtc_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WebRTC Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => WebRTCBloc()..add(const WebRTCEvent.initialize()),
        child: const MyHomePage(title: 'WebRTC Demo'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _localRenderer = RTCVideoRenderer();
  final _remoteRenderer = RTCVideoRenderer();

  @override
  void initState() {
    super.initState();
    _initRenderers();
  }

  Future<void> _initRenderers() async {
    await _localRenderer.initialize();
    await _remoteRenderer.initialize();
  }

  @override
  void dispose() {
    _localRenderer.dispose();
    _remoteRenderer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: BlocConsumer<WebRTCBloc, WebRTCState>(
        listener: (context, state) {
          if (state.localStream != null) {
            _localRenderer.srcObject = state.localStream;
          }
          if (state.remoteStream != null) {
            _remoteRenderer.srcObject = state.remoteStream;
          }
        },
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 320,
                      height: 240,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                      child: RTCVideoView(_localRenderer),
                    ),
                    Container(
                      width: 320,
                      height: 240,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                      child: RTCVideoView(_remoteRenderer),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        context.read<WebRTCBloc>().add(
                          state.isCameraOn ? const WebRTCEvent.stopCamera() : const WebRTCEvent.startCamera(),
                        );
                      },
                      child: Text(state.isCameraOn ? '카메라 끄기' : '카메라 켜기'),
                    ),
                    ElevatedButton(
                      onPressed: state.status == WebRTCStatus.ready
                          ? () {
                              print('DEBUG: 연결 시작 버튼 클릭됨');
                              context.read<WebRTCBloc>().add(const WebRTCEvent.createOffer());
                              print('DEBUG: CreateOffer 이벤트 발송됨');
                            }
                          : null,
                      child: Text(
                        state.status == WebRTCStatus.connecting
                            ? '연결 중...'
                            : state.status == WebRTCStatus.connected
                                ? '연결됨'
                                : '연결 시작',
                      ),
                    ),
                  ],
                ),
                if (state.errorMessage != null)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '오류: ${state.errorMessage}',
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '상태: ${_getStatusText(state.status)}',
                    style: TextStyle(
                      color: _getStatusColor(state.status),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  String _getStatusText(WebRTCStatus status) {
    switch (status) {
      case WebRTCStatus.initial:
        return '초기화 전';
      case WebRTCStatus.initializing:
        return '초기화 중...';
      case WebRTCStatus.ready:
        return '준비됨';
      case WebRTCStatus.connecting:
        return '연결 중...';
      case WebRTCStatus.connected:
        return '연결됨';
      case WebRTCStatus.error:
        return '오류 발생';
    }
  }

  Color _getStatusColor(WebRTCStatus status) {
    switch (status) {
      case WebRTCStatus.initial:
        return Colors.grey;
      case WebRTCStatus.initializing:
      case WebRTCStatus.connecting:
        return Colors.orange;
      case WebRTCStatus.ready:
        return Colors.blue;
      case WebRTCStatus.connected:
        return Colors.green;
      case WebRTCStatus.error:
        return Colors.red;
    }
  }
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'webrtc_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$WebRTCState {
  WebRTCStatus get status => throw _privateConstructorUsedError;
  MediaStream? get localStream => throw _privateConstructorUsedError;
  MediaStream? get remoteStream => throw _privateConstructorUsedError;
  RTCPeerConnection? get peerConnection => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  bool get isCameraOn => throw _privateConstructorUsedError;

  /// Create a copy of WebRTCState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WebRTCStateCopyWith<WebRTCState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WebRTCStateCopyWith<$Res> {
  factory $WebRTCStateCopyWith(
    WebRTCState value,
    $Res Function(WebRTCState) then,
  ) = _$WebRTCStateCopyWithImpl<$Res, WebRTCState>;
  @useResult
  $Res call({
    WebRTCStatus status,
    MediaStream? localStream,
    MediaStream? remoteStream,
    RTCPeerConnection? peerConnection,
    String? errorMessage,
    bool isCameraOn,
  });
}

/// @nodoc
class _$WebRTCStateCopyWithImpl<$Res, $Val extends WebRTCState>
    implements $WebRTCStateCopyWith<$Res> {
  _$WebRTCStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WebRTCState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? localStream = freezed,
    Object? remoteStream = freezed,
    Object? peerConnection = freezed,
    Object? errorMessage = freezed,
    Object? isCameraOn = null,
  }) {
    return _then(
      _value.copyWith(
            status:
                null == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as WebRTCStatus,
            localStream:
                freezed == localStream
                    ? _value.localStream
                    : localStream // ignore: cast_nullable_to_non_nullable
                        as MediaStream?,
            remoteStream:
                freezed == remoteStream
                    ? _value.remoteStream
                    : remoteStream // ignore: cast_nullable_to_non_nullable
                        as MediaStream?,
            peerConnection:
                freezed == peerConnection
                    ? _value.peerConnection
                    : peerConnection // ignore: cast_nullable_to_non_nullable
                        as RTCPeerConnection?,
            errorMessage:
                freezed == errorMessage
                    ? _value.errorMessage
                    : errorMessage // ignore: cast_nullable_to_non_nullable
                        as String?,
            isCameraOn:
                null == isCameraOn
                    ? _value.isCameraOn
                    : isCameraOn // ignore: cast_nullable_to_non_nullable
                        as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WebRTCStateImplCopyWith<$Res>
    implements $WebRTCStateCopyWith<$Res> {
  factory _$$WebRTCStateImplCopyWith(
    _$WebRTCStateImpl value,
    $Res Function(_$WebRTCStateImpl) then,
  ) = __$$WebRTCStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    WebRTCStatus status,
    MediaStream? localStream,
    MediaStream? remoteStream,
    RTCPeerConnection? peerConnection,
    String? errorMessage,
    bool isCameraOn,
  });
}

/// @nodoc
class __$$WebRTCStateImplCopyWithImpl<$Res>
    extends _$WebRTCStateCopyWithImpl<$Res, _$WebRTCStateImpl>
    implements _$$WebRTCStateImplCopyWith<$Res> {
  __$$WebRTCStateImplCopyWithImpl(
    _$WebRTCStateImpl _value,
    $Res Function(_$WebRTCStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WebRTCState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? localStream = freezed,
    Object? remoteStream = freezed,
    Object? peerConnection = freezed,
    Object? errorMessage = freezed,
    Object? isCameraOn = null,
  }) {
    return _then(
      _$WebRTCStateImpl(
        status:
            null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as WebRTCStatus,
        localStream:
            freezed == localStream
                ? _value.localStream
                : localStream // ignore: cast_nullable_to_non_nullable
                    as MediaStream?,
        remoteStream:
            freezed == remoteStream
                ? _value.remoteStream
                : remoteStream // ignore: cast_nullable_to_non_nullable
                    as MediaStream?,
        peerConnection:
            freezed == peerConnection
                ? _value.peerConnection
                : peerConnection // ignore: cast_nullable_to_non_nullable
                    as RTCPeerConnection?,
        errorMessage:
            freezed == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                    as String?,
        isCameraOn:
            null == isCameraOn
                ? _value.isCameraOn
                : isCameraOn // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc

class _$WebRTCStateImpl implements _WebRTCState {
  const _$WebRTCStateImpl({
    this.status = WebRTCStatus.initial,
    this.localStream,
    this.remoteStream,
    this.peerConnection,
    this.errorMessage,
    this.isCameraOn = false,
  });

  @override
  @JsonKey()
  final WebRTCStatus status;
  @override
  final MediaStream? localStream;
  @override
  final MediaStream? remoteStream;
  @override
  final RTCPeerConnection? peerConnection;
  @override
  final String? errorMessage;
  @override
  @JsonKey()
  final bool isCameraOn;

  @override
  String toString() {
    return 'WebRTCState(status: $status, localStream: $localStream, remoteStream: $remoteStream, peerConnection: $peerConnection, errorMessage: $errorMessage, isCameraOn: $isCameraOn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WebRTCStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.localStream, localStream) ||
                other.localStream == localStream) &&
            (identical(other.remoteStream, remoteStream) ||
                other.remoteStream == remoteStream) &&
            (identical(other.peerConnection, peerConnection) ||
                other.peerConnection == peerConnection) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.isCameraOn, isCameraOn) ||
                other.isCameraOn == isCameraOn));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    localStream,
    remoteStream,
    peerConnection,
    errorMessage,
    isCameraOn,
  );

  /// Create a copy of WebRTCState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WebRTCStateImplCopyWith<_$WebRTCStateImpl> get copyWith =>
      __$$WebRTCStateImplCopyWithImpl<_$WebRTCStateImpl>(this, _$identity);
}

abstract class _WebRTCState implements WebRTCState {
  const factory _WebRTCState({
    final WebRTCStatus status,
    final MediaStream? localStream,
    final MediaStream? remoteStream,
    final RTCPeerConnection? peerConnection,
    final String? errorMessage,
    final bool isCameraOn,
  }) = _$WebRTCStateImpl;

  @override
  WebRTCStatus get status;
  @override
  MediaStream? get localStream;
  @override
  MediaStream? get remoteStream;
  @override
  RTCPeerConnection? get peerConnection;
  @override
  String? get errorMessage;
  @override
  bool get isCameraOn;

  /// Create a copy of WebRTCState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WebRTCStateImplCopyWith<_$WebRTCStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

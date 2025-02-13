import 'package:equatable/equatable.dart';
import 'package:flutter_tts/flutter_tts.dart';

class BookReaderState extends Equatable {
  final bool isPlaying;
  final String bookContent;
  final FlutterTts reader;

  const BookReaderState({
    required this.isPlaying,
    required this.bookContent,
    required this.reader,
  });

  BookReaderState copyWith({
    bool? isPlaying,
    String? bookContent,
    FlutterTts? reader,
  }) {
    return BookReaderState(
      isPlaying: isPlaying ?? this.isPlaying,
      bookContent: bookContent ?? this.bookContent,
      reader: reader ?? this.reader,
    );
  }

  @override
  List<Object?> get props => [
        isPlaying,
        bookContent,
      ];
}

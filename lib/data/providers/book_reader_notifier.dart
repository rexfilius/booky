import 'package:booky/data/providers/app_providers.dart';
import 'package:booky/data/models/book_reader_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tts/flutter_tts.dart';

final bookReaderProvider =
    NotifierProvider<BookReaderNotifier, BookReaderState>(
        BookReaderNotifier.new);

class BookReaderNotifier extends Notifier<BookReaderState> {
  @override
  BookReaderState build() {
    return BookReaderState(
      isPlaying: false,
      bookContent: ref.watch(inMemoryBookProvider).content,
      reader: FlutterTts(),
    );
  }

  void stopReading() {
    if (state.isPlaying) {
      state.reader.stop();
      state = state.copyWith(isPlaying: false);
    } else {
      return;
    }
  }

  Future<void> read() async {
    if (state.isPlaying) {
      await state.reader.pause();
      state = state.copyWith(isPlaying: false);
    } else {
      await state.reader.setLanguage("en-US");
      await state.reader.speak(state.bookContent);
      state = state.copyWith(isPlaying: true);
    }

    state.reader.setStartHandler(() {
      print('Speech has started');
    });
    state.reader.setCompletionHandler(() {
      print('Speech has completed successfully');
    });
    state.reader.setErrorHandler((msg) {
      print('An error occurred: $msg');
    });
    state.reader.setPauseHandler(() {});
    state.reader.setContinueHandler(() {});
  }
}

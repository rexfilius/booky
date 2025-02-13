import 'package:booky/data/providers/book_reader_notifier.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('BookReaderNotifier', () {
    test('read() toggles isPlaying state', () {
      final notifier = BookReaderNotifier();

      expect(notifier.state.isPlaying, isFalse);
      notifier.read();
      expect(notifier.state.isPlaying, isTrue);

      notifier.read();
      expect(notifier.state.isPlaying, isFalse);
    });

    test('stopReading() sets isPlaying to false', () {
      final notifier = BookReaderNotifier();

      // Set the notifier to a playing state.
      notifier.read();
      expect(notifier.state.isPlaying, isTrue);

      // Calling stopReading() should stop the reading.
      notifier.stopReading();
      expect(notifier.state.isPlaying, isFalse);
    });
  });
}

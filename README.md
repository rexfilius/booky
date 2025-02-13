# Flutter Book Reader App

## Overview

This Flutter application is a book reader that allows users to browse a collection of books, view detailed information about each title, and listen to the content read aloud. It features three main screens — BookStoreScreen, BookDetailScreen, and BookReaderScreen — and uses [Riverpod](https://riverpod.dev/)for state management.

## Features

BookStore Screen
- Displays a grid view of books loaded from a JSON file (assets/json/bookJson.json).
- Tapping on a book navigates to the BookDetail screen.

BookDetail Screen
- Shows the book's synopsis, cover image, and author information.
- Includes a "Read" button that takes the user to the BookReader screen.

BookReader Screen
- Offers play, pause, and stop controls for text-to-speech functionality.
- When the play button is pressed, the app reads the book content aloud, with options to pause or stop as needed.

## Project Structure
```
lib/
├── data/
|   ├──models/
|   |  ├── book_reader_state.dart
|   |  ├── book.dart
│   ├──providers/
|      ├──app_providers.dart
|      ├── book_reader_notifier.dart 
├── routes/
│   └── app_route.dart    
├── providers/
│   └── book_provider.dart
├── ui/
|   ├──components/
|   |  └── book_store_item.dart
|   ├── book_store_screen.dart 
|   ├── book_detail_screen.dart
|   └── book_reader_screen.dart
└──main.dart

assets/
├── images/
└── json/
    └── bookJson.json
```

## Getting Started

1. Clone the repository
2. Ensure Flutter is installed on your system
3. Run `flutter pub get` to install dependencies
4. Run `flutter run` to start the application

## Dependencies

Add the following dependencies to your `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^latest_version
  flutter_riverpod: ^latest_version
  flutter_tts: ^latest_version
  equatable: ^latest_version

```





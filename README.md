# flutter-app
Step:
1. flutter create Tracker_app
2. cd Tracker_app
3. in your directory. lib/main.dart. The main function is the entry point to any Dart program, and a Flutter app is just a Dart program. The runApp method is part of the Flutter SDK, and it takes a widget as an argument. In this case, an instance of the MainApp widget is being passed in.
4. MainApp is the root widget, as it's the widget that's passed into runApp. Within this widget, there's a build method that returns another widget called MaterialApp. Essentially, this is what a Flutter app is: a composition of widgets that make up a tree structure called the widget tree.
5. MaterialApp is the outermost widget that acts as the main foundation of your app. This widget tells Flutter that your app will use Material Design (Google's design standard).

Its function: Sets the app's theme (dominant colors, fonts), manages page routing, and provides basic navigation configuration.

An analogy: If an app were a country, then MaterialApp would be its laws and underlying systems.

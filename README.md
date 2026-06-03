# flutter-app
Step:
1. flutter create Tracker_app
2. cd Tracker_app
3. in your directory. lib/main.dart. The main function is the entry point to any Dart program, and a Flutter app is just a Dart program. The runApp method is part of the Flutter SDK, and it takes a widget as an argument. In this case, an instance of the MainApp widget is being passed in.
4. MainApp is the root widget, as it's the widget that's passed into runApp. Within this widget, there's a build method that returns another widget called MaterialApp. Essentially, this is what a Flutter app is: a composition of widgets that make up a tree structure called the widget tree.
5. MaterialApp is the outermost widget that acts as the main foundation of your app. This widget tells Flutter that your app will use Material Design (Google's design standard).

Its function: Sets the app's theme (dominant colors, fonts), manages page routing, and provides basic navigation configuration.

An analogy: If an app were a country, then MaterialApp would be its laws and underlying systems.
6.A scaffold is a widget that provides the basic visual structure or framework for a page.

Function: Provides space for standard application components such as the appBar (top bar), body (main content), floatingActionButton (floating button in the bottom corner), and drawer (side menu).

An analogy: If an application page were a house, then the scaffold would be the foundation, walls, and roof.
7.Center is a very simple yet important layout widget.

Its function: Forces its child widgets to be positioned exactly in the middle of the available space (vertically and horizontally).

An analogy: It's like an assistant shifting a display to fit perfectly in the center of a table.
8.Text is a widget used to display strings or text on the screen.

Function: Displays text and adjusts its style, such as font size, color, boldness (bold/italic), and font type.

Analogy: Like a sign or sign hanging inside a house.
9. flutter run -d chrome
The app will build and launch in a new instance of Chrome.
flutter run: The main command for running the Flutter application you are developing.

-d: Short for Device. This indicates that you want to select a specific device to display the application.

chrome: The selected target device, which is the Google Chrome browser (Web).

dart devtools
Running this command starts the DevTools server and opens the interface in a browser.
When the app opens in a browser, you'll be presented with a wealth of powerful tools for analyzing your app. Here are its main features:
1. Flutter Inspector (View UI Structure)
This tool is used to visually view the widget tree.

Usefulness: If your app looks cluttered, you can click on any part of the screen, and DevTools will tell you what widget it is, its size, and why it's positioned there. You can also enable Toggle Select Widget Mode to point directly to the UI in your app.

2. Performance View (Check Application Smoothness)
Use: Monitor whether your application is running smoothly (e.g., stable at 60 FPS or 120 FPS). If your application is lagging or janky, this tool will detect which lines of code are causing performance degradation.

3. CPU Profiler (View Processor Workload)
Use: Shows which functions or activities are consuming the most CPU power on your computer or phone when the application is running.

4. Memory View (Track RAM Usage)
Use: Monitor how much memory (RAM) your application is consuming. This is crucial for detecting memory leaks (a condition where an application continuously consumes RAM and refuses to release it, which can cause the user's phone to slow down or crash).

5. Network Tab (Monitor Internet Traffic)
Use: If your application retrieves data from the internet (API), this tab will display all incoming and outgoing requests and responses. You can see whether the sent data is correct or if there are any errors (such as Error 404 or 500).

6. Logging (Error Log)
Usefulness: Displays all command-line messages, system logs, and error messages (such as print or debugPrint that you write in your code) in a neat and structured manner.

Find the DevTools URL printed in the terminal where your app is running (for example: Serving DevTools at http://127.0.0.1:9101).
Copy this URL.
Paste it into the connect bar in the DevTools browser page.

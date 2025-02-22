# CustomNavBar

CustomNavBar is a highly customizable and animated bottom navigation bar for Flutter applications. It provides smooth animations, shadow effects, and dynamic icon scaling to enhance the user experience.

## Features

- Animated bottom navigation bar
- Customizable icon sizes, colors, and backgrounds
- Smooth transitions and animations
- Supports shadow effects for selected icons
- PageView-based navigation

## Getting Started

### Installation

Add the following dependency to your `pubspec.yaml` file:

```
dependencies:
  custom_navbar:
    git:
      url: https://github.com/hijaaaazz/custom_navbar.git
```

Then, run:

```
flutter pub get
```

## Usage

Import the package:

```
import 'package:custom_navbar/custom_navbar.dart';
```

### Example Implementation

```
import 'package:flutter/material.dart';
import 'package:custom_navbar/custom_navbar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(child: Text("Home Page")),
        bottomNavigationBar: CustomNavBar(
          initialIndex: 0,
          icons: [
            Icon(Icons.home),
            Icon(Icons.search),
            Icon(Icons.person),
          ],
          onTap: (index) {
            print("Selected Index: $index");
          },
        ),
      ),
    );
  }
}
```

## Customization

You can customize the `CustomNavBar` by changing the following parameters:

```
CustomNavBar(
  initialIndex: 1,
  icons: [Icon(Icons.dashboard), Icon(Icons.settings), Icon(Icons.notifications)],
  onTap: (index) => print("Tapped: $index"),
  navBarHeight: 80,
  iconBoxSize: 65,
  selectedBackgroundColor: Colors.blue,
  unselectedBackgroundColor: Colors.grey[300]!,
  selectedIconColor: Colors.white,
  unselectedIconColor: Colors.black,
  selectedIconSize: 35,
  unselectedIconSize: 20,
  shadowColor: Colors.black,
  shadowBlurRadius: 10,
  animationDuration: Duration(milliseconds: 250),
);
```

## Contributing

Contributions are welcome! If you find any issues or have feature requests, please open an [issue](https://github.com/hijaaaazz/custom_navbar/issues) or submit a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](https://github.com/hijaaaazz/custom_navbar/blob/main/LICENSE) file for more details.

## Contact

For any queries or support, feel free to reach out via [GitHub](https://github.com/hijaaaazz/custom_navbar).


# Flutter Playlist Animation

Playlist Hero & Page Transition Animations inspired by [original SwiftUI implementation](https://twitter.com/_Kavsoft/status/1582065292360187904)


https://user-images.githubusercontent.com/50345358/198117074-b6317fd3-1a98-4151-b179-415e19d24e7b.mp4

## Hero Animation Card Flip Effect

Behind the scenes, there are 3️⃣ widgets involved in a Hero animation

1️⃣ The widget in the first page (placeholder)

2️⃣ The widget in the second page (placeholder)

3️⃣ The widget animating in between (in-flight ✈️, the widget we want to override)

(In most cases you don't need to override this widget, but you can override it for complex effects and do cool stuff!)

```dart
// 1️⃣ First page hero widget
Hero(
  tag: 'hero-animation', // The tags should match
  flightShuttleBuilder:
      (_, Animation<double> animation, __, ___, ____) {
    final rotationAnimation = Tween<double>(
      begin: 0.0, // This value should match the first Hero
      end: 2.0, // This value should match the second Hero
    ).animate(animation);

    // 3️⃣ ✈️ The widget animating in between
    return AnimatedBuilder(
      animation: rotationAnimation,
      child: const Card(),
      builder: (context, child) {
        return Transform(
          transform: Matrix4.identity()
          	..setEntry(3, 2, 0.003)
            ..rotateX(rotationAnimation.value * pi),
          alignment: Alignment.center,
          child: child,
        );
      },
    );
  },
  child: Transform(
    transform: Matrix4.identity()
    	..setEntry(3, 2, 0.003)
        ..rotateX(0), // This should match the Tween's begin value
    alignment: Alignment.center,
    child: const Card(), // The child widget tree for both Heros should match
  ),
);

// 2️⃣ Second page hero widget
Hero(
  tag: 'hero-animation', // The tags should match
  child: Transform(
    transform: Matrix4.identity()
      ..setEntry(3, 2, 0.003)
      ..rotateX(2 * pi), // This should match the Tween's end value
    alignment: Alignment.center,
    child: const Card(), // The child widget tree for both Heros should match
  ),
);
```



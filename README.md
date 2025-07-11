# glassify

`glassify` is a lightweight Flutter package that provides customizable glassmorphic UI containers with frosted blur effects, gradient backgrounds, and elegant gradient borders.

It includes:

- 🔳 `GlassContainer` — for fixed-size glassmorphic widgets.
- 🔲 `GlassFlexContainer` — for responsive/flexible layout use.
- 🎨 Custom `GlassBorder` painter with gradient outlines.

## ✨ Example

```dart
GlassContainer(
  width: 250,
  height: 250,
  borderRadius: 20,
  blur: 10,
  border: 2,
  backgroundGradient: LinearGradient(
    colors: [Colors.white.withAlpha(50), Colors.blue.withAlpha(50)],
  ),
  borderGradient: LinearGradient(
    colors: [Colors.white, Colors.blue],
  ),
  child: Center(child: Text("Glass!")),
),

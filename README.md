# 🧊 Glasses (glassify)

`glasses` is a lightweight Flutter package that enables **glassmorphic UI** effects using customizable containers. It features frosted blur, gradient backgrounds, and elegant gradient borders to help you craft stunning modern UIs.

---

## 🚀 Features

* 🔳 `GlassContainer` – fixed-size, frosted-glass widget with blur and gradient.
* 🔲 `GlassFlexContainer` – responsive version with full flexibility.
* 🖌️ `GlassBorder` – custom painter for beautiful gradient borders.

---

## ✨ Preview

> *Coming soon: animated GIF or screenshot — let me know if you'd like help generating it.*

---

## 🧱 Example Usage

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
)
```

---

## 📦 Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  glasses: ^1.0.0
```

Then run:

```bash
flutter pub get
```

---

## 🧪 Testing

You can run the included test suite with:

```bash
flutter test
```

---

## 📁 Folder Structure

```
lib/
├── glassify.dart          # Export file
├── widgets/
│   ├── glass_border.dart
│   ├── glass_container.dart
│   └── glass_flex_container.dart
test/
└── glassify_test.dart
```

---

## 🤝 Contributing

Contributions, bug reports, and feature suggestions are welcome!
Clone the repo and feel free to submit a PR:

```bash
git clone https://github.com/Redvey/glasses.git
```

---

## 📜 License

MIT License — see [LICENSE](LICENSE) for details.


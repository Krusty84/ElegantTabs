[![Swift Package Index](https://img.shields.io/badge/swift--package--index-ElegantTabs-blue)](https://swiftpackageindex.com/Krusty84/ElegantTabs)
![Swift](https://img.shields.io/badge/swift-5.7-orange)
[![Platform](https://img.shields.io/badge/platform-macOS%2015%2B-lightgrey)](https://developer.apple.com/macos/)

# ElegantTabs

A simple SwiftUI package for macOS that gives you an easy and nice tab view. You can add icons, text, and custom colors. It handles hover and selection effects for you.

## Features

✅ Easy to add tabs with text and icons

✅ Customizable colors, sizes, and fonts

✅ Hover and selected backgrounds

✅ Uses SwiftUI and a result builder for clean code


## Requirements

- Tested on macOS 15
- Tested on Xcode 16.2
- Swift 5.7 or later


## Installation

### Swift Package Manager

1. In Xcode, choose **File ▸ Add Packages…**
2. Enter the URL of this repository:
   ```
   https://github.com/Krusty84/ElegantTabsView.git
   ```
3. Select the version (for example, Up to Next Major 1.0.0) and add it to your app target.

## Usage

Import the package and use `ElegantTabsView` in your SwiftUI view. You need a `@State` or `@Binding` integer to track which tab is selected.

```swift
import SwiftUI
import ElegantTabs

struct ContentView: View {
    @State private var selectedTab = 0

    var body: some View {
        ElegantTabsView(selection: $selectedTab) {
            TabItem(title: "Home", icon: .system(name: "house.fill")) {
                Text("Welcome to Home")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            TabItem(title: "Settings", icon: .system(name: "gearshape.fill")) {
                Text("Settings go here")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
    }
}
```

## Custom Style

You can change colors, icon size, fonts, padding, and more by passing a custom `TabStyle`.

```swift
let customStyle = TabStyle(
    selectedColor: .white,
    unselectedColor: .gray,
    hoverBackground: Color.blue.opacity(0.2),
    selectedBackground: Color.blue.opacity(0.3),
    backgroundColor: Color(NSColor.windowBackgroundColor),
    iconSize: 28,
    font: .headline,
    cornerRadius: 10,
    padding: 14,
    tabHeight: 55,
    selectedPadding: 6
)

ElegantTabsView(selection: $selectedTab, style: customStyle) {
    TabItem(title: "Tab 1", icon: .system(name: "1.circle")) {
        Text("First tab view")
    }
    TabItem(title: "Tab 2", icon: .system(name: "2.circle")) {
        Text("Second tab view")
    }
}
```

## Examples

### Default Style

```swift
struct ContentView: View {
    @State private var selectedTab = 0
    var body: some View {
        ElegantTabsView(selection: $selectedTab) {
            TabItem(title: "Home", icon: .system(name: "house.fill")) {
                Text("Welcome to Home")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            TabItem(title: "Settings", icon: .system(name: "gearshape.fill")) {
                Text("Settings go here")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
    }
}
```
<img width="900" alt="image" src="https://github.com/user-attachments/assets/0ae9c3e9-74b2-4f16-984c-ed63357368f6" />

### Bold & Large Tabs

```swift
struct ContentView: View {
    @State private var selectedTab = 1

    let boldStyle = TabStyle(
        selectedColor: .white,
        unselectedColor: .gray,
        hoverBackground: Color.blue.opacity(0.2),
        selectedBackground: Color.blue.opacity(0.3),
        backgroundColor: Color(NSColor.windowBackgroundColor),
        iconSize: 30,
        font: .headline,
        cornerRadius: 12,
        padding: 16,
        tabHeight: 60,
        selectedPadding: 8
    )

    var body: some View {
        ElegantTabsView(selection: $selectedTab, style: boldStyle) {
            TabItem(title: "Dashboard", icon: .system(name: "speedometer")) {
                Text("Dashboard Screen")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            TabItem(title: "Profile", icon: .system(name: "person.crop.circle")) {
                Text("Profile Screen")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
    }
}
```
<img width="900" alt="image" src="https://github.com/user-attachments/assets/8ee267dd-51b9-41ce-b7a6-98b8105e4ea8" />

### Compact Tabs

```swift
struct ContentView: View {
    @State private var selectedTab = 0

    let compactStyle = TabStyle(
        selectedColor: .blue,
        unselectedColor: .primary,
        hoverBackground: Color.gray.opacity(0.2),
        selectedBackground: Color.gray.opacity(0.1),
        backgroundColor: Color(NSColor.windowBackgroundColor),
        iconSize: 20,
        font: .caption,
        cornerRadius: 6,
        padding: 6,
        tabHeight: 40,
        selectedPadding: 2
    )

    var body: some View {
        ElegantTabsView(selection: $selectedTab, style: compactStyle) {
            TabItem(title: "Files", icon: .system(name: "folder")) {
                Text("File List")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            TabItem(title: "Search", icon: .system(name: "magnifyingglass")) {
                Text("Search View")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            TabItem(title: "Help", icon: .system(name: "questionmark.circle")) {
                Text("Help Center")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
    }
}
```
<img width="900" alt="image" src="https://github.com/user-attachments/assets/cf3b2030-a577-444f-8d07-c78bb9bcf6a7" />

### Colorful Accent Tabs

```swift
struct ContentView: View {
    @State private var selectedTab = 2

    let accentStyle = TabStyle(
        selectedColor: .white,
        unselectedColor: .white.opacity(0.7),
        hoverBackground: Color.purple.opacity(0.3),
        selectedBackground: Color.purple,
        backgroundColor: Color.black,
        iconSize: 24,
        font: .subheadline,
        cornerRadius: 10,
        padding: 12,
        tabHeight: 50,
        selectedPadding: 4
    )

    var body: some View {
        ElegantTabsView(selection: $selectedTab, style: accentStyle) {
            TabItem(title: "Music", icon: .system(name: "music.note")) {
                Text("Music Player")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            TabItem(title: "Videos", icon: .system(name: "play.rectangle")) {
                Text("Video Gallery")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            TabItem(title: "Podcasts", icon: .system(name: "mic.fill")) {
                Text("Podcast List")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
    }
}
```
<img width="900" alt="image" src="https://github.com/user-attachments/assets/2a10d527-27b3-4461-aa39-bf6055915420" />

### Small Icons & Captions

```swift
struct ContentView: View {
    @State private var selectedTab = 0

    let smallIconStyle = TabStyle(
        selectedColor: .green,
        unselectedColor: .secondary,
        hoverBackground: Color.green.opacity(0.2),
        selectedBackground: Color.green.opacity(0.3),
        backgroundColor: Color(NSColor.windowBackgroundColor),
        iconSize: 18,
        font: .caption2,
        cornerRadius: 8,
        padding: 10,
        tabHeight: 45,
        selectedPadding: 3
    )

    var body: some View {
        ElegantTabsView(selection: $selectedTab, style: smallIconStyle) {
            TabItem(title: "Chat", icon: .system(name: "bubble.left.and.bubble.right")) {
                Text("Chat Room")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            TabItem(title: "Calls", icon: .system(name: "phone")) {
                Text("Call Log")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            TabItem(title: "Settings", icon: .system(name: "gear")) {
                Text("App Settings")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
    }
}
```
<img width="900" alt="image" src="https://github.com/user-attachments/assets/80b91042-05a0-4313-888e-0fab1f89061e" />

## Respect

Inspired by Jerome [ (myCustomTabView).](https://github.com/jmuzet/myCustomTabView) repository, Merci Dear Jerome!

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

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
import ElegantTabsView

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

### Basic Tabs

```swift
ElegantTabsView(selection: $selectedTab) {
    TabItem(title: "First", icon: .system(name: "1.circle")) {
        Text("First View")
    }
    TabItem(title: "Second", icon: .system(name: "2.circle")) {
        Text("Second View")
    }
    TabItem(title: "Third", icon: .system(name: "3.circle")) {
        Text("Third View")
    }
}
```

### Tabs with Asset Icons

```swift
ElegantTabsView(selection: $selectedTab) {
    TabItem(title: "Profile", icon: .asset(name: "profile_icon")) {
        ProfileView()
    }
    TabItem(title: "Help", icon: .asset(name: "help_icon")) {
        HelpView()
    }
}
```

### Using Custom Style

```swift
ElegantTabsView(selection: $selectedTab, style: customStyle) {
    TabItem(title: "A", icon: .system(name: "a.circle")) {
        Text("View A")
    }
    TabItem(title: "B", icon: .system(name: "b.circle")) {
        Text("View B")
    }
}
```


## Respect

Inspired by Jerome [ (myCustomTabView).](https://github.com/jmuzet/myCustomTabView) repository, Merci Dear Jerome!

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

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
   https://github.com/Krusty84/ElegantTabs.git
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

### Tab -> your View

```swift
struct ContentView: View {
    @State private var selectedTab = 0

    var body: some View {
        ElegantTabsView(selection: $selectedTab) {
            TabItem(title: "Profile", icon: .system(name: "person.crop.circle")) {
                ProfileView()        // your custom view
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            TabItem(title: "Settings", icon: .system(name: "gearshape.fill")) {
                SettingsView()       // another custom view
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
    }
}

struct ProfileView: View {
    var body: some View {
        VStack(spacing: 20) {
            // Avatar
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.blue)
            
            // Name
            Text("David Allan Coe")
                .font(.title)
                .fontWeight(.semibold)
            
            // Bio
            Text("macOS Developer\nLoves Swift & SwiftUI")
                .font(.body)
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
            
            Spacer()
        }
        .padding()
    }
}

struct SettingsView: View {
    @State private var notificationsOn = true
    @State private var darkModeOn = false
    @State private var autoPlayVideos = false

    var body: some View {
        Form {
            Section(header: Text("Preferences")) {
                Toggle("Enable Notifications", isOn: $notificationsOn)
                Toggle("Dark Mode", isOn: $darkModeOn)
                Toggle("Auto-play Videos", isOn: $autoPlayVideos)
            }

            Section(header: Text("About")) {
                HStack {
                    Text("App Version")
                    Spacer()
                    Text("1.0.0")
                        .foregroundColor(.secondary)
                }
                HStack {
                    Text("Terms of Service")
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(.secondary)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
```
<img width="900" alt="image" src="https://github.com/user-attachments/assets/bf0ddb2b-c429-416c-822f-7ec6b8ce3442" />

### Pass somedate to Tab-View

```swift
import SwiftUI
import ElegantTabs

class AppModel: ObservableObject {
    @Published var username: String = "Bob"
    @Published var isPremiumUser: Bool = false
}

struct ContentView: View {
    @State private var selectedTab = 0
    @StateObject private var model = AppModel()

    var body: some View {
        ElegantTabsView(selection: $selectedTab) {
            TabItem(title: "Profile", icon: .system(name: "person.crop.circle")) {
                ProfileView()
            }
            TabItem(title: "Settings", icon: .system(name: "gearshape.fill")) {
                SettingsView()
            }
        }
        .environmentObject(model)    // data passing
    }
}

struct ProfileView: View {
    @EnvironmentObject var model: AppModel

    var body: some View {
        VStack(spacing: 16) {
            Text("Welcome, \(model.username)!")
                .font(.title)
            Text(model.isPremiumUser ? "Premium ✨" : "Free User")
                .foregroundColor(model.isPremiumUser ? .yellow : .gray)
        }
        .padding()
    }
}

struct SettingsView: View {
    @EnvironmentObject var model: AppModel

    var body: some View {
        Form {
            Section(header: Text("Account")) {
                TextField("Name", text: $model.username)
            }
            Section(header: Text("Subscription")) {
                Toggle("Premium User", isOn: $model.isPremiumUser)
            }
        }
        .padding()
    }
}
```
<img width="900" alt="image" src="https://github.com/user-attachments/assets/c1701c94-be9a-4bc7-8d0f-6b41e8575cce" />

### Place your Tab application in Menu Bar

```swift

import SwiftUI
import AppKit
import ElegantTabs

@main
struct MyApp: App {
    var body: some Scene {
        MenuBarExtra {
            MenuBarContentView()
                .frame(width: 300, height: 200)
        } label: {
            Image(systemName: "dot.radiowaves.left.and.right")
        }
        .menuBarExtraStyle(.window)
    }
}

// Switch between MainWindow (tabs) and InfoWindow by holding Option
struct MenuBarContentView: View {
    @State private var optionKey = false

    var body: some View {
        Group {
            if optionKey {
                InfoWindow()
            } else {
                MainWindow()
            }
        }
        .onAppear {
            optionKey = NSEvent.modifierFlags.contains(.option)
        }
    }
}

//MainWindow

struct MainWindow: View {
    @State private var selected = 0

    let style = TabStyle(
        selectedColor: .white,
        unselectedColor: .blue.opacity(0.7),
        hoverBackground: Color.blue.opacity(0.2),
        selectedBackground: Color.blue,
        backgroundColor: Color(NSColor.windowBackgroundColor),
        iconSize: 20,
        font: .subheadline,
        cornerRadius: 8,
        padding: 10,
        tabHeight: 45,
        selectedPadding: 4
    )

    var body: some View {
        ElegantTabsView(selection: $selected, style: style) {
            TabItem(title: "Status", icon: .system(name: "antenna.radiowaves.left.and.right")) {
                StatusView()
            }
            TabItem(title: "Settings", icon: .system(name: "gearshape.fill")) {
                SettingsView()
            }
        }
    }
}


struct InfoWindow: View {
    @State private var selected = 0

    var body: some View {
        ElegantTabsView(selection: $selected) {
            TabItem(title: "About", icon: .system(name: "info.circle")) {
                AboutView()
            }
            TabItem(title: "Help", icon: .system(name: "questionmark.circle")) {
                HelpView()
            }
        }
    }
}


struct StatusView: View {
    var body: some View {
        VStack {
            Text("All systems nominal")
                .font(.headline)
            Text("Last check: \(Date(), format: .dateTime.hour().minute())")
                .font(.caption)
        }
        .padding()
    }
}

struct AboutView: View {
    var body: some View {
        VStack(spacing: 8) {
            Text("My Menu Bar App").font(.title2).bold()
            Text("Version 1.0.0").font(.caption)
            Text("© 2025 My Company").font(.footnote).foregroundColor(.secondary)
        }
        .padding()
    }
}

// Use your existing SettingsView here
struct SettingsView: View {
    @State private var notificationsOn = true
    @State private var darkModeOn = false

    var body: some View {
        Form {
            Section("Preferences") {
                Toggle("Enable Notifications", isOn: $notificationsOn)
                Toggle("Dark Mode",           isOn: $darkModeOn)
            }
        }
        .padding()
    }
}

struct HelpView: View {
    var body: some View {
        VStack(spacing: 8) {
            Text("Need help?").font(.headline)
            Text("Visit example.com/help for docs and support.")
                .font(.caption)
                .multilineTextAlignment(.center)
        }
        .padding()
    }
}
```
<img width="350" alt="image" src="https://github.com/user-attachments/assets/e6e86617-ff49-433c-8506-e6eeed8e665c" />

## Respect

Inspired by Jerome [ (myCustomTabView).](https://github.com/jmuzet/myCustomTabView) repository, Merci Dear Jerome!

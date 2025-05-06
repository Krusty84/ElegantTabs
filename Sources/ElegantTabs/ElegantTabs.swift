// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

// MARK: - TabItem and Builder
public struct TabItem: Identifiable {
  public let id = UUID()
  public let title: String
  public let icon: TabIcon
  public let view: AnyView

  public init<Content: View>(
    title: String,
    icon: TabIcon,
    @ViewBuilder view: () -> Content
  ) {
    self.title = title
    self.icon = icon
    self.view = AnyView(view())
  }
}


/// Result builder to collect TabItem instances into an Array
@resultBuilder
public struct TabItemsBuilder<Content: View> {
    public static func buildBlock(_ items: TabItem<Content>...) -> [TabItem<Content>] {
        items
    }
}

public enum TabIcon {
    case system(name: String)
    case asset(name: String)
}

public struct TabStyle {
    public var selectedColor: Color = Color.blue
    public var unselectedColor: Color = Color.primary
    public var hoverBackground: Color = Color.gray.opacity(0.3)
    public var selectedBackground: Color = Color.gray.opacity(0.3)
    public var backgroundColor: Color = Color(nsColor: .windowBackgroundColor)
    public var iconSize: CGFloat = 24
    public var font: Font = .caption
    public var cornerRadius: CGFloat = 8
    public var padding: CGFloat = 12
    public var tabHeight: CGFloat = 50
    public var selectedPadding: CGFloat = 4

    public static let `default` = TabStyle()

    // <-- add this:
    public init(
        selectedColor: Color = Color.blue,
        unselectedColor: Color = Color.primary,
        hoverBackground: Color = Color.gray.opacity(0.3),
        selectedBackground: Color = Color.gray.opacity(0.3),
        backgroundColor: Color = Color(nsColor: .windowBackgroundColor),
        iconSize: CGFloat = 24,
        font: Font = .caption,
        cornerRadius: CGFloat = 8,
        padding: CGFloat = 12,
        tabHeight: CGFloat = 50,
        selectedPadding: CGFloat = 4
    ) {
        self.selectedColor = selectedColor
        self.unselectedColor = unselectedColor
        self.hoverBackground = hoverBackground
        self.selectedBackground = selectedBackground
        self.backgroundColor = backgroundColor
        self.iconSize = iconSize
        self.font = font
        self.cornerRadius = cornerRadius
        self.padding = padding
        self.tabHeight = tabHeight
        self.selectedPadding = selectedPadding
    }
}


struct TabButtonStyle: ButtonStyle {
    let style: TabStyle
    let isSelected: Bool
    let isHovered: Bool

    func makeBody(configuration: Configuration) -> some View {
        // Determine fill color
        let fillColor = isSelected
            ? style.selectedBackground
            : (isHovered ? style.hoverBackground : Color.clear)

        return configuration.label
            .font(style.font)
            .padding(style.padding)                      // Inner padding
            .frame(height: style.tabHeight)             // Fixed height for all tabs
            .background(
                RoundedRectangle(cornerRadius: style.cornerRadius)
                    .fill(fillColor)
            )
            .padding(isSelected                       // Outer padding for selected
                ? style.selectedPadding
                : 0
            )
            .frame(maxWidth: .infinity)
            .foregroundColor(isSelected
                ? style.selectedColor
                : style.unselectedColor
            )
            .contentShape(Rectangle())
    }
}

// MARK: - GoodProperTabsView View
public struct ElegantTabsView<Content: View>: View {
    @Binding public var selection: Int
    public let items: [TabItem<Content>]
    public let style: TabStyle
    
    @State private var hoveredIndex: Int? = nil

    public init(
        selection: Binding<Int>,
        style: TabStyle = .default,
        @TabItemsBuilder<Content> items: () -> [TabItem<Content>]
    ) {
        self._selection = selection
        self.style = style
        self.items = items()
    }

    public var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                ForEach(Array(items.enumerated()), id: \.offset) { index, item in
                    Button {
                        selection = index
                    } label: {
                        VStack(spacing: 4) {
                            switch item.icon {
                            case .system(let name):
                                Image(systemName: name)
                                    .font(.system(size: style.iconSize))
                            case .asset(let name):
                                Image(name)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: style.iconSize, height: style.iconSize)
                            }
                            Text(item.title)
                        }
                        .accessibilityLabel(item.title)
                        .onHover { hovering in
                            hoveredIndex = hovering ? index : nil
                        }
                    }
                    .buttonStyle(
                        TabButtonStyle(
                            style: style,
                            isSelected: selection == index,
                            isHovered: hoveredIndex == index
                        )
                    )
                }
            }
            .background(style.backgroundColor)

            // Show the selected view
            items[selection].view
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

// MARK: - Previews
//#Preview {
//    Group {
//        // Default Style
//        ElegantTabsPreview(selection: 0, style: .default)
//            .previewDisplayName("Default Style")
//            .frame(width: 600, height: 400)
//
//        // Bold & Large Tabs
//        ElegantTabsPreview(
//            selection: 1,
//            style: TabStyle(
//                selectedColor: .white,
//                unselectedColor: .gray,
//                hoverBackground: Color.blue.opacity(0.2),
//                selectedBackground: Color.blue.opacity(0.3),
//                backgroundColor: Color(nsColor: .windowBackgroundColor),
//                iconSize: 30,
//                font: .headline,
//                cornerRadius: 12,
//                padding: 16,
//                tabHeight: 60,
//                selectedPadding: 8
//            )
//        )
//        .previewDisplayName("Bold & Large Tabs")
//        .frame(width: 600, height: 400)
//
//        // Compact Tabs (smaller height, tighter padding)
//        ElegantTabsPreview(
//            selection: 2,
//            style: TabStyle(
//                padding: 6,
//                tabHeight: 40,
//                selectedPadding: 2
//            )
//        )
//        .previewDisplayName("Compact Tabs")
//        .frame(width: 600, height: 300)
//
//        // Small Icons & Captions
//        ElegantTabsPreview(
//            selection: 3,
//            style: TabStyle(
//                iconSize: 20,
//                font: .caption2
//            )
//        )
//        .previewDisplayName("Small Icons & Captions")
//        .frame(width: 600, height: 300)
//    }
//}
//
//private struct ElegantTabsPreview: View {
//    @State private var selection: Int
//    let style: TabStyle
//
//    init(selection: Int = 0, style: TabStyle = .default) {
//        self._selection = State(initialValue: selection)
//        self.style = style
//    }
//
//    var body: some View {
//        ElegantTabsView(selection: $selection, style: style) {
//            TabItem(title: "HF Propagation", icon: .system(name: "antenna.radiowaves.left.and.right")) {
//                Text("HF Propagation details")
//                    .frame(maxWidth: .infinity, maxHeight: .infinity)
//            }
//            TabItem(title: "VHF Propagation", icon: .system(name: "antenna.radiowaves.left.and.right")) {
//                Text("VHF Propagation details")
//                    .frame(maxWidth: .infinity, maxHeight: .infinity)
//            }
//            TabItem(title: "Solar Weather", icon: .system(name: "sun.max")) {
//                Text("Solar Weather data")
//                    .frame(maxWidth: .infinity, maxHeight: .infinity)
//            }
//            TabItem(title: "Settings", icon: .system(name: "gearshape")) {
//                Text("App Settings")
//                    .frame(maxWidth: .infinity, maxHeight: .infinity)
//            }
//        }
//    }
//}

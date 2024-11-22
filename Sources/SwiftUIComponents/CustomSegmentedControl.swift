//
//  CustomSegmentedControl.swift
//  UXComponentsExample
//
//  Created by Ankur Chauhan on 11/22/24.
//

import SwiftUI

@available(iOS 14.0, *)
public struct BoxedCustomSegmentedControl<T: RawRepresentable & CaseIterable & Hashable>: View where T.RawValue == String {
    @Binding var selectedTab: T
    var underlineColor: Color = .purple
    var textColor: Color = .black
    var selectedTextColor: Color = .purple
    var padding: CGFloat = 10.0

    @Namespace private var animationNamespace
    @State private var tabWidths: [UUID: CGFloat] = [:]
    private var tabIDs: [T: UUID] = Dictionary(uniqueKeysWithValues: T.allCases.map { ($0, UUID()) })

    public init(selectedTab: Binding<T>, underlineColor: Color = .purple, textColor: Color = .black, selectedTextColor: Color = .purple, padding: CGFloat = 10.0) {
        self._selectedTab = selectedTab
        self.underlineColor = underlineColor
        self.textColor = textColor
        self.selectedTextColor = selectedTextColor
        self.padding = padding
    }

    public var body: some View {
        ScrollViewReader { proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: padding) {
                    ForEach(Array(T.allCases), id: \.self) { tab in
                        Button(action: {
                            withAnimation {
                                self.selectedTab = tab
                                proxy.scrollTo(tabIDs[tab], anchor: .center)
                            }
                        }) {
                            Text(tab.rawValue)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 5)
                                .background(
                                    Group {
                                        if selectedTab == tab {
                                            RoundedRectangle(cornerRadius: 10)
                                                .fill(underlineColor.opacity(0.2))
                                                .matchedGeometryEffect(id: "background", in: animationNamespace)
                                        }
                                    }
                                )
                                .foregroundColor(self.selectedTab == tab ? selectedTextColor : textColor)
                                .background(GeometryReader { geometry in
                                    Color.clear
                                        .preference(key: TabWidthPreferenceKey.self, value: [tabIDs[tab]!: geometry.size.width])
                                })
                                .id(tabIDs[tab])
                        }
                    }
                }
                .padding(.horizontal, padding)
                .onPreferenceChange(TabWidthPreferenceKey.self) { preferences in
                    self.tabWidths = preferences
                }
                .overlayPreferenceValue(TabWidthPreferenceKey.self) { preferences in
                    GeometryReader { geometry in
                        if let selectedTabWidth = preferences[tabIDs[selectedTab]!], let selectedIndex = Array(T.allCases).firstIndex(of: selectedTab) {
                            let totalOffset = Array(T.allCases)[0..<selectedIndex].reduce(0) { result, tab in
                                result + (preferences[tabIDs[tab]!] ?? 0) + padding
                            }
                            Rectangle()
                                .frame(width: selectedTabWidth - 2 * padding, height: 2)
                                .offset(x: totalOffset, y: 48)
                                .foregroundColor(underlineColor)
                                .animation(.easeInOut, value: selectedTab)
                        }
                    }
                }
            }
        }
        .frame(height: 50)
    }
}

struct TabWidthPreferenceKey: PreferenceKey {
    typealias Value = [UUID: CGFloat]
    
    static var defaultValue: [UUID: CGFloat] = [:]

    static func reduce(value: inout [UUID: CGFloat], nextValue: () -> [UUID: CGFloat]) {
        value.merge(nextValue()) { current, _ in current }
    }
}

//
//  SwiftUIView.swift
//  
//
//  Created by Ankur Chauhan on 11/22/24.
//

import SwiftUI

enum MonthsTabs: String, CaseIterable, Hashable {
    case january = "January"
    case february = "February"
    case march = "march"
    case april = "april"
    case may  = "may"
    case june = "june"
    case july = "july"
    case august = "august"
    case september = "september"
    case october = "october"
    case novemeber = "novemeber"
    case decemeber = "decemeber"
}

@available(iOS 14.0.0, *)
struct ControlsView: View {
    @State var selectedMonthTab: MonthsTabs = .january

    var body: some View {
        ScrollView {
            BoxedCustomSegmentedControl(selectedTab: $selectedMonthTab, underlineColor: .blue, textColor: .gray, selectedTextColor: .blue)

        }
        .padding()
        .background(Color.green.opacity(0.1))
    }
}

@available(iOS 14.0.0, *)
#Preview {
    ControlsView()
}

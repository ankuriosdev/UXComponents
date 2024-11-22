//
//  File.swift
//  
//
//  Created by Ankur Chauhan on 11/22/24.
//

import SwiftUI

@available(iOS 13.0.0, *)
public struct PrimaryButton: View {
    var text: String
    var action: () -> Void
    
    public init(text: String, action: @escaping () -> Void) {
        self.text = text
        self.action = action
    }
    
    public var body: some View {
        Button(action: action) {
            Text(text)
                .foregroundColor(.white)
                .padding()
                .background(Color.blue)
                .cornerRadius(10)
        }
    }
}

@available(iOS 13.0.0, *)
public struct SecondaryButton: View {
    var text: String
    var action: () -> Void
    
    public init(text: String, action: @escaping () -> Void) {
        self.text = text
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            Text(text)
                .foregroundColor(.blue)
                .padding()
                .background(Color.white)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.blue, lineWidth: 2)
                )
        }
    }
}

@available(iOS 13.0.0, *)
public struct OutlineButton: View {
    var text: String
    var action: () -> Void
    
    public init(text: String, action: @escaping () -> Void) {
        self.text = text
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            Text(text)
                .foregroundColor(.red)
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.blue, lineWidth: 1)
                )
        }
    }
}

@available(iOS 13.0.0, *)
public struct IconButton: View {
    var icon: Image
    var action: () -> Void
    
    public init(icon: Image, action: @escaping () -> Void) {
        self.icon = icon
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            icon
                .foregroundColor(.yellow)
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.blue, lineWidth: 1)
                )
        }
    }
}

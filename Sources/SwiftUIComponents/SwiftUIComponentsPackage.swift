import SwiftUI

@available(iOS 13.0.0, *)
public struct SwiftUIComponentsPackage {

    public static func primaryButton(text: String, action: @escaping () -> Void) -> some View {
        PrimaryButton(text: text, action: action)
    }
    
    public static func secondaryButton(text: String, action: @escaping () -> Void) -> some View {
        SecondaryButton(text: text, action: action)
    }
    
    public static func outlineButton(text: String, action: @escaping () -> Void) -> some View {
        OutlineButton(text: text, action: action)
    }
    
    public static func iconButton(icon: Image,  action: @escaping () -> Void) -> some View {
        IconButton(icon: icon, action: action)
    }
    
}

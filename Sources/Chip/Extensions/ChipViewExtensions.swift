import SwiftUI

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {
    public func chipStyle(_ style: some ChipStyle) -> some View {
        environment(\.chipStyle, style)
    }
}

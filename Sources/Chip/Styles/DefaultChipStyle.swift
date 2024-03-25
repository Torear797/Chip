import SwiftUI

public struct DefaultChipStyle: ChipStyle {
    public init() {}
    
    public func makeBody(configuration: Configuration) -> some View {
        DefaultChip(configuration: configuration)
    }
    
    private struct DefaultChip: View {
        
        // MARK: Constants
        
        private let textFont = Font.subheadline
        private let textColor = Color.black.opacity(0.7)
        private let backgroundUnselectedColor = Color.gray.opacity(0.2)
        private let backgroundSelectedColor = Color.accentColor
        private let borderColor = Color.gray
        private let height: CGFloat = 35
        private let radius: CGFloat = 20
        private let configuration: ChipStyleConfiguration
        
        init(configuration: ChipStyleConfiguration) {
            self.configuration = configuration
        }
        
        private var backgroundColor: Color {
            configuration.$isOn.wrappedValue
            ? backgroundSelectedColor
            : backgroundUnselectedColor
        }
        
        private var fontColor: Color {
            configuration.$isOn.wrappedValue ? .white : .black
        }
        
        var body: some View {
            if #available(iOS 15.0, *) {
                configuration
                    .label
                    .font(textFont)
                    .foregroundStyle(fontColor)
                    .lineLimit(1)
                    .frame(height: height)
                    .padding(.horizontal, 10)
                    .background(backgroundColor)
                    .clipShape(.rect(cornerRadius: radius))
                    .animation(.default, value: configuration.isOn)
            } else {
                configuration
                    .label
                    .font(textFont)
                    .foregroundColor(fontColor)
                    .lineLimit(1)
                    .frame(height: height)
                    .padding(.horizontal, 10)
                    .background(backgroundColor)
                    .clipShape(.rect(cornerRadius: radius))
                    .animation(.default, value: configuration.isOn)
            }
        }
    }
}

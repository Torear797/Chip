import SwiftUI

public struct ChipStyleConfiguration {
    public let label: Label
    @Binding public var isOn: Bool
    
    public struct Label: View {
        let underlyingLabel: AnyView
        
        init(_ label: some View) {
            self.underlyingLabel = AnyView(label)
        }
        
        public var body: some View {
            underlyingLabel
        }
    }
}

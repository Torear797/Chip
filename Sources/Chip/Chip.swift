import SwiftUI

public struct Chip<Label> : View where Label : View {
    
    // MARK: Constants
    
    private let action: () -> Void
    private let label: AnyView
    
    // MARK: Binding
    
    @Binding private var isOn: Bool
    
    // MARK: Environment
    
    @Environment(\.chipStyle) var style
    
    // MARK: Init
    
    init(
        isOn: Binding<Bool>,
        action: @escaping () -> Void = {},
        @ViewBuilder label: () -> Label
    ) {
        self.action = action
        self.label = AnyView(label())
        _isOn = isOn
    }
    
    // MARK: View
    
    public var body: some View {
        let configuration = ChipStyleConfiguration(
            label: .init(chip),
            isOn: $isOn
        )
        
        return AnyView(style.makeBody(configuration: configuration))
    }
    
    private var chip: some View {
        Button {
            isOn.toggle()
            action()
        } label: {
            label
        }
    }
}

// MARK: - Initializers

public extension Chip {
    init(
        isOn: Bool = false,
        action: @escaping () -> Void = {},
        @ViewBuilder label: () -> Label
    ) {
        self.action = action
        self.label = AnyView(label())
        _isOn = .constant(isOn)
    }
}

public extension Chip where Label == Text {
    init(
        _ titleKey: LocalizedStringKey,
        isOn: Binding<Bool>,
        action: @escaping () -> Void = {}
    ) {
        self.action = action
        self.label = AnyView(Text(titleKey))
        _isOn = isOn
    }
    
    init<S>(_ title: S, isOn: Binding<Bool>) where S : StringProtocol {
        self.action = {}
        self.label = AnyView(Text(title))
        _isOn = isOn
    }
    
    init(
        _ titleKey: LocalizedStringKey,
        isOn: Bool = false,
        action: @escaping () -> Void = {}
    ) {
        self.action = action
        self.label = AnyView(Text(titleKey))
        _isOn = .constant(isOn)
    }
}

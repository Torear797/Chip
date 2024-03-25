import SwiftUI

public extension EnvironmentValues {
    var chipStyle: any ChipStyle {
        get { self[ChipStyleKey.self] }
        set { self[ChipStyleKey.self] = newValue }
    }
}

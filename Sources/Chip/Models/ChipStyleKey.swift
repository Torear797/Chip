import SwiftUI

public struct ChipStyleKey: EnvironmentKey {
    public static var defaultValue: any ChipStyle = DefaultChipStyle()
}

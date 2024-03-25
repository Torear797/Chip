import SwiftUI

public protocol ChipStyle {
    associatedtype Body : View
    
    @ViewBuilder func makeBody(configuration: Self.Configuration) -> Self.Body
    
    typealias Configuration = ChipStyleConfiguration
}

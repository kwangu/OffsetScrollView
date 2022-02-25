import SwiftUI

public struct OffsetScrollView<Content: View>: View {

    var content: Content

    @Binding var offset: CGPoint
    var showIndicators: Bool
    var axis: Axis.Set

    @State var startOffset: CGPoint = .zero

    public init(offset: Binding<CGPoint>, showIndicators: Bool, axis: Axis.Set, @ViewBuilder content: () -> Content) {
        self.content = content()
        self._offset = offset
        self.showIndicators = showIndicators
        self.axis = axis
    }

    public var body: some View {
        ScrollView(axis, showsIndicators: showIndicators, content: {
            content
                .overlay(
                    GeometryReader { proxy -> Color in

                        let rect = proxy.frame(in: .global)

                        if startOffset == .zero {
                            DispatchQueue.main.async {
                                startOffset = CGPoint(x: rect.minX, y: rect.minY)
                            }
                        }

                        DispatchQueue.main.async {

                            if startOffset == .zero {
                                startOffset = CGPoint(x: rect.minX, y: rect.minY)
                            }

                            self.offset = CGPoint(x: startOffset.x - rect.minX, y: startOffset.y - rect.minY)
                        }

                        return Color.clear
                    }
                        .frame(width: UIScreen.main.bounds.width, height: 0, alignment: .top)
                )
        })

    }
}

# OffsetScrollView

SwiftUI ScrollView에서 Offset 값 가져올수있는 ScrollView

<br>
<br>

---

## 파라미터

OffsetScrollView(offset: Binding<CGPoint>, showIndicators: Bool, axis: Axis.Set) {
content
}

---

## 사용 방법

```
import SwiftUI
import OffsetScrollView

struct ContentView: View {
    @State var offsetX: CGPoint = .zero
    @State var offsetY: CGPoint = .zero

    var body: some View {
        VStack {
            Text("offset : \(offsetX.x)")
                .font(.title)

            OffsetScrollView(offset: $offsetX, showIndicators: false, axis: .horizontal) {
                LazyHStack {
                    ForEach(1..<10) {_ in
                        Rectangle()
                        .frame(width: 100, height: 100)
                        .background(Color.red)
                        .padding()
                    }
                }
            }

            Text("offset : \(offsetY.y)")
                .font(.title)

            OffsetScrollView(offset: $offsetY, showIndicators: false, axis: .vertical) {
                LazyVStack {
                    ForEach(1..<10) {_ in
                        Rectangle()
                        .frame(width: 100, height: 100)
                        .background(Color.red)
                        .padding()
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

```

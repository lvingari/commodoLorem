struct MyShape: View {
    @State private var position: CGPoint = .zero
    @State private var size: CGSize = .zero

    var body: some View {
        GeometryReader { geometry in
            Path { path in
                path.move(to: .zero)
                path.addLines([
                    .init(x: position.x, y: position.y),
                    .init(x: position.x + size.width, y: position.y),
                    .init(x: position.x + size.width, y: position.y + size.height),
                    .init(x: position.x, y: position.y + size.height)
                ])
            }
            .fill(Color.red)
            .frame(width: size.width, height: size.height)
            .animation(.default, value: animatableData)
        }
        .onAppear {
            animatableData = MyShapeAnimatableData(position: position, size: size)
        }
    }
}

struct MyShapeAnimatableData {
    let position: CGPoint
    let size: CGSize

    var animatableData: AnimatablePair<CGPoint, CGSize> {
        .pair(position, size)
    }
}

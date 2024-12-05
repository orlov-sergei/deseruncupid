import SwiftUI

struct CustomGestureView: View {
    // State variables to track gesture state
    @GestureState private var offset: CGSize = .zero
    @State private var position: CGSize = .zero

    var body: some View {
        // A simple rectangle view
        Rectangle()
            .fill(Color.blue)
            .frame(width: 100, height: 100)
            .offset(x: position.width + offset.width, y: position.height + offset.height) // Apply offset
            .gesture(
                DragGesture()
                    .updating($offset) { value, state, _ in
                        state = value.translation
                    }
                    .onEnded { value in
                        position.width += value.translation.width
                        position.height += value.translation.height
                    }
            )
            .animation(.spring())
    }
}

struct ContentView: View {
    var body: some View {
        CustomGestureView()
    }
}

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

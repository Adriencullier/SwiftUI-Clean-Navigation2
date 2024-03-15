import SwiftUI

struct PushView: View {
    var backAction: () -> Void
    
    var body: some View {
        VStack {
            Button {
                backAction()
            } label: {
                Text("Back")
            }
            .buttonStyle(.borderedProminent)
        }
        .navigationTitle("Push View")
    }
}

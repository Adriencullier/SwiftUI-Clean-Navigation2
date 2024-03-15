import SwiftUI

struct ModalView: View {
    var dismissAction: () -> Void
    var body: some View {
        VStack {
            Button {
                dismissAction()
            } label: {
                Text("Dismiss")
            }
            .buttonStyle(.borderedProminent)
        }        
        .navigationTitle("Modal View")
        .navigationBarTitleDisplayMode(.large)
    }
}

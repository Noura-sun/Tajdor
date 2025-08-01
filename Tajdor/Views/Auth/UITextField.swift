import SwiftUI

struct RTLTextField: UIViewRepresentable {
    @Binding var text: String
    var placeholder: String
    var isSecure: Bool

    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField()
        textField.placeholder = placeholder
        textField.textAlignment = .right
        textField.semanticContentAttribute = .forceRightToLeft
        textField.borderStyle = .none
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.isSecureTextEntry = isSecure
        textField.delegate = context.coordinator
        return textField
    }

    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
        uiView.placeholder = placeholder
        uiView.textAlignment = .right
        uiView.semanticContentAttribute = .forceRightToLeft
        uiView.isSecureTextEntry = isSecure
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UITextFieldDelegate {
        var parent: RTLTextField

        init(_ parent: RTLTextField) {
            self.parent = parent
        }

        func textFieldDidChangeSelection(_ textField: UITextField) {
            parent.text = textField.text ?? ""
        }
    }
}

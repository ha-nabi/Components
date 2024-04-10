//
//  RepresentableTextField.swift
//  Components
//
//  Created by 강치우 on 2/9/24.
//

import SwiftUI

struct RepresentableTextField: UIViewRepresentable {
    /// 플레이스 홀더
    let placeHolderString: String
    let keyboardType: UIKeyboardType?
    @Binding var text: String
    @Binding var isFocused: Bool
    
    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField(frame: .zero)
        textField.delegate = context.coordinator
        textField.autocorrectionType = .no
        textField.spellCheckingType = .no
        textField.keyboardType = keyboardType ?? .default
        textField.attributedPlaceholder = NSAttributedString(string: placeHolderString, attributes: [
            .font: UIFont.systemFont(ofSize: 14, weight: .regular),
            .foregroundColor: UIColor(red: 189/255.0, green: 194/255.0, blue: 204/255.0, alpha: 1.0)
        ])
        textField.addTarget(context.coordinator, action: #selector(Coordinator.textFieldDidChange(_:)), for: .editingChanged)
        return textField
    }
    
    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UITextFieldDelegate {
        var parent: RepresentableTextField
        
        init(_ textField: RepresentableTextField) {
            self.parent = textField
        }
        
        @objc func textFieldDidChange(_ textField: UITextField) {
            DispatchQueue.main.async {
                self.parent.text = textField.text ?? ""
            }
        }
        
        func textFieldDidBeginEditing(_ textField: UITextField) {
            DispatchQueue.main.async {
                self.parent.isFocused = true
            }
        }
        
        func textFieldDidEndEditing(_ textField: UITextField) {
            DispatchQueue.main.async {
                self.parent.isFocused = false
            }
        }
    }
}

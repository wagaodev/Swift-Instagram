
import UIKit


class Utilities {

  func inputContainerView(textField: UITextField) -> UIView {
    let view = UIView()
    view.heightAnchor.constraint(equalToConstant: 50).isActive = true
    view.addSubview(textField)
    textField.anchor(left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingBottom: 8)
    return view
  }

  func textField(withPlaceholder placeholder: String) -> UITextField {
    let tf = UITextField()
    let spacer = UIView()
    tf.textColor = .white
    tf.layer.cornerRadius = 8
    tf.autocapitalizationType = .none
    tf.borderStyle = .none
    spacer.setDimensions(height: 50, width: 12)
    tf.leftView = spacer
    tf.leftViewMode = .always
    tf.setHeight(50)
    tf.backgroundColor = UIColor(white: 1, alpha: 0.1)
    tf.font = UIFont.systemFont(ofSize: 16)
    tf.keyboardAppearance = .dark
    tf.attributedPlaceholder = NSAttributedString(string: placeholder,
                                                  attributes: [NSAttributedString.Key.foregroundColor: UIColor(white: 1, alpha: 0.7)])
    return tf
  }

  func atttributedButton(_ fristPart: String, _ secondPart: String) -> UIButton {
    let button = UIButton(type: .system)
    let attributedTitle = NSMutableAttributedString(string: fristPart,
                                                    attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16),
                                                    NSAttributedString.Key.foregroundColor: UIColor(white: 1, alpha: 0.7)])
    attributedTitle.append(NSAttributedString(string: secondPart, attributes: [NSMutableAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16),
                                                                                    NSMutableAttributedString.Key.foregroundColor: UIColor.white]))
    button.setAttributedTitle(attributedTitle, for: .normal)
    return button
  }

  func actionButton(_ nameButton: String) -> UIButton {
    let button = UIButton(type: .system)
    let attributedTitle = NSMutableAttributedString(string: nameButton,
                                                    attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16),
                                                                 NSAttributedString.Key.foregroundColor: UIColor.white])
    button.setAttributedTitle(attributedTitle, for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.backgroundColor = #colorLiteral(red: 0.3323569142, green: 0.2387397452, blue: 0.739278577, alpha: 1)
    button.heightAnchor.constraint(equalToConstant: 50).isActive = true
    button.layer.cornerRadius = 8
    return button
  }
}

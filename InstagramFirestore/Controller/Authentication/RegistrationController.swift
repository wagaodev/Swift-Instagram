import UIKit

class RegistrationController: UIViewController {
  
  // MARK: - Properties
  
  private let photoButton: UIButton = {
    let button = UIButton(type: .system)
    button.setImage(#imageLiteral(resourceName: "plus_photo"), for: .normal)
    button.tintColor = .white
    return button
  }()
  
  private lazy var emailContainerView: UIView = {
    let view = Utilities().inputContainerView(textField: emailTextField)
    return view
  }()
  
  private lazy var passwordContainerView: UIView = {
    let view = Utilities().inputContainerView(textField: passwordTextField)
    return view
  }()
  
  private lazy var fullnameContainerView: UIView = {
    let view = Utilities().inputContainerView(textField: fullNameTextField)
    return view
  }()
  
  private lazy var usernameContainerView: UIView = {
    let view = Utilities().inputContainerView(textField: usernameTextField)
    return view
  }()
  
  private let emailTextField: UITextField = {
    let tf = Utilities().textField(withPlaceholder: "Email")
    return tf
  }()
  
  private let passwordTextField: UITextField = {
    let tf = Utilities().textField(withPlaceholder: "Password")
    tf.isSecureTextEntry = true
    return tf
  }()
  
  private let fullNameTextField: UITextField = {
    let tf = Utilities().textField(withPlaceholder: "Fullname")
    return tf
  }()
  
  private let usernameTextField: UITextField = {
    let tf = Utilities().textField(withPlaceholder: "Username")
    return tf
  }()
  
  private lazy var alreadyHaveAccount: UIButton = {
    let button = Utilities().atttributedButton("Already have an account? ", "Log In")
    button.addTarget(self, action: #selector(handleNavigateToLogin), for: .touchUpInside)
    return button
  }()
  
  private lazy var registrationButton: UIButton = {
    let button = Utilities().actionButton("Sign Up")
    button.addTarget(self, action: #selector(handleRegister), for: .touchUpInside)
    return button
  }()
  
  // MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureUI()
  }
  
  // MARK: - API
  
  // MARK: - Selectors
  
  @objc func handleRegister() {
    print("DEBUG: botão de login...")
  }
  
  @objc func handleNavigateToLogin() {
    let controller = LoginController()
    navigationController?.pushViewController(controller, animated: true)
  }
  
  
  // MARK: - Helpers
  
  func configureUI() {
    configureGradientLayer()
    navigationController?.navigationBar.isHidden = true
    navigationController?.navigationBar.barStyle = .black
    
    view.addSubview(photoButton)
    photoButton.centerX(inView: view)
    photoButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
    photoButton.setDimensions(height: 140, width: 140)
    
    let stack = UIStackView(arrangedSubviews: [emailContainerView, passwordContainerView,
                                               fullnameContainerView, usernameContainerView, registrationButton])
    stack.axis = .vertical
    stack.spacing = 20
    stack.distribution = .fillEqually
    
    view.addSubview(stack)
    stack.anchor(top: photoButton.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 32, paddingLeft: 32, paddingRight: 32)
    
    view.addSubview(alreadyHaveAccount)
    alreadyHaveAccount.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor,
                              right: view.rightAnchor, paddingLeft: 50, paddingBottom: 16, paddingRight: 40)
    
  }
  
}

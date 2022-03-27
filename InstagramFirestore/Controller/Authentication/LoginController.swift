import UIKit

class LoginController: UIViewController {
  
  // MARK: - Properties

  private var viewModel = LoginViewModel()
  
  private let logoImageView: UIImageView = {
    let logo = UIImageView()
    logo.contentMode = .scaleAspectFit
    logo.clipsToBounds = true
    logo.image = #imageLiteral(resourceName: "Instagram_logo_white")
    return logo
  }()
  
  private lazy var emailContainerView: UIView = {
    let view = Utilities().inputContainerView(textField: emailTextField)
    return view
  }()
  
  private lazy var passwordContainerView: UIView = {
    let view = Utilities().inputContainerView(textField: passwordTextField)
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
  
  private lazy var forgotPassword: UIButton = {
    let button = Utilities().atttributedButton("Forgot your password? ", "Get help signing in.")
    button.addTarget(self, action: #selector(handleForgotPassword), for: .touchUpInside)
    return button
  }()
  
  private lazy var dontHaveAccountButton: UIButton = {
    let button = Utilities().atttributedButton("Don't have an accounnt? ", "Sign Up")
    button.addTarget(self, action: #selector(handleNavigateToSignUp), for: .touchUpInside)
    return button
  }()
  
  private lazy var loginButton: UIButton = {
    let button = Utilities().actionButton("Log In")
    button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
    return button
  }()
  
  // MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureUI()
    configureNotificationObservers()
  }
  
  // MARK: - API
  
  // MARK: - Selectors
  
  @objc func handleLogin() {
    print("DEBUG: botão de login...")
  }
  
  @objc func handleNavigateToSignUp() {
    let controller = RegistrationController()
    navigationController?.pushViewController(controller, animated: true)
  }
  
  @objc func handleForgotPassword() {
    print("DEBUG: Navigation to forgot password screen...")
  }

  @objc func textDidChange(sender: UITextField) {
    if sender == emailTextField {
      viewModel.email = sender.text
    } else {
      viewModel.password = sender.text
    }
    loginButton.backgroundColor = viewModel.buttonBackgroundColor
    loginButton.setTitleColor(viewModel.buttonTitleColor, for: .normal)
    loginButton.isEnabled = viewModel.formIsValid
  }
  
  // MARK: - Helpers
  
  func configureUI() {
    configureGradientLayer()
    navigationController?.navigationBar.isHidden = true
    navigationController?.navigationBar.barStyle = .black
    
    view.addSubview(logoImageView)
    logoImageView.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor)
    logoImageView.setDimensions(height: 150, width: 150)
    
    let stack = UIStackView(arrangedSubviews: [emailContainerView, passwordContainerView, loginButton, forgotPassword])
    stack.axis = .vertical
    stack.spacing = 20
    stack.distribution = .fillEqually
    
    view.addSubview(stack)
    stack.anchor(top: logoImageView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingLeft: 32, paddingRight: 32)
    
    view.addSubview(dontHaveAccountButton)
    dontHaveAccountButton.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor,
                                 right: view.rightAnchor, paddingLeft: 50, paddingBottom: 16, paddingRight: 40)

  }

  func configureNotificationObservers() {
    emailTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    passwordTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
  }
}

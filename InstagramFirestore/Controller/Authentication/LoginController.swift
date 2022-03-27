import UIKit

class LoginController: UIViewController {

  // MARK: - Properties

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
    let button = UIButton(type: .system)
    button.setTitle("Log In", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.backgroundColor = #colorLiteral(red: 0.3323569142, green: 0.2387397452, blue: 0.739278577, alpha: 1)
    button.heightAnchor.constraint(equalToConstant: 50).isActive = true
    button.layer.cornerRadius = 8
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
    button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
    return button
  }()

  // MARK: - Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()

    configureUI()
  }

  // MARK: - API

  // MARK: - Selectors

  @objc func handleLogin() {
    print("DEBUG: botão de login...")
  }

  @objc func handleNavigateToSignUp() {
    print("DEBUG: Navigation to create account...")
  }

  @objc func handleForgotPassword() {
    print("DEBUG: Navigation to forgot password screen...")
  }

  // MARK: - Helpers

  func configureUI() {

    navigationController?.navigationBar.isHidden = true
    navigationController?.navigationBar.barStyle = .black


    let gradient = CAGradientLayer()
    gradient.colors = [UIColor.systemIndigo.cgColor, UIColor.systemPink.cgColor]
    gradient.locations = [0.35, 1]
    view.layer.addSublayer(gradient)
    gradient.frame = view.frame

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

}

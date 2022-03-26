
import UIKit

class FeedCell: UICollectionViewCell {

  // MARK: - Properties

  private let profileImageView: UIImageView = {
    let iv = UIImageView()
    iv.contentMode = .scaleAspectFill
    iv.clipsToBounds = true
    iv.isUserInteractionEnabled = true
    iv.image = #imageLiteral(resourceName: "venom-7")
    return iv
  }()

  private lazy var  usernameButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitleColor(.black, for: .normal)
    button.setTitle("wagão", for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
    button.addTarget(self, action: #selector(didTapUsername), for: .touchUpInside)
    return button
  }()

  // MARK: - Lifecycle

  override init(frame: CGRect){
    super.init(frame: frame)
    configureUI()
  }

  required init?(coder: NSCoder){
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - API

  // MARK: - Selectors

  @objc func didTapUsername(){
    print("DEBUG: Username...")
  }

  // MARK: - Helpers

  func configureUI() {
    backgroundColor = .white

    addSubview(profileImageView)
    profileImageView.anchor(top: topAnchor, left: leftAnchor, paddingTop: 12, paddingLeft: 12)
    profileImageView.setDimensions(height: 40, width: 40)
    profileImageView.layer.cornerRadius = 40 / 2

    addSubview(usernameButton)
    usernameButton.centerY(inView: profileImageView, leftAnchor: profileImageView.rightAnchor, paddingLeft: 8)
  }

}

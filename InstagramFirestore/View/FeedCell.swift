
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

  private let postImageView: UIImageView = {
    let iv = UIImageView()
    iv.contentMode = .scaleAspectFill
    iv.clipsToBounds = true
    iv.isUserInteractionEnabled = true
    iv.image = #imageLiteral(resourceName: "venom-7")
    return iv
  }()

  private lazy var likesButton: UIButton = {
    let button = UIButton()
    button.setImage(#imageLiteral(resourceName: "like_unselected"), for: .normal)
    button.tintColor = .black
    return button
  }()

  private lazy var commentButton: UIButton = {
    let button = UIButton()
    button.setImage(#imageLiteral(resourceName: "comment"), for: .normal)
    button.tintColor = .black
    return button
  }()

  private lazy var shareButton: UIButton = {
    let button = UIButton()
    button.setImage(#imageLiteral(resourceName: "send2"), for: .normal)
    button.tintColor = .black
    return button
  }()

  private lazy var favoriteButton: UIButton = {
    let button = UIButton()
    button.setImage(#imageLiteral(resourceName: "ribbon"), for: .normal)
    button.tintColor = .black
    return button
  }()

  private let likesLabel: UILabel = {
    let label = UILabel()
    label.text = "981 Likes"
    label.font = UIFont.boldSystemFont(ofSize: 13)
    return label
  }()

  private let captionLabel: UILabel = {
    let label = UILabel()
    label.text = "Uma mão no código e outra no carinho"
    label.font = UIFont.systemFont(ofSize: 14)
    return label
  }()

  private let postTimeLabel: UILabel = {
    let label = UILabel()
    label.text = "2 horas atrás"
    label.font = UIFont.systemFont(ofSize: 12)
    label.textColor = .lightGray
    return label
  }()


  // MARK: - Lifecycle

  override init(frame: CGRect){
    super.init(frame: frame)
    backgroundColor = .white

    addSubview(profileImageView)
    profileImageView.anchor(top: topAnchor, left: leftAnchor, paddingTop: 12, paddingLeft: 12)
    profileImageView.setDimensions(height: 40, width: 40)
    profileImageView.layer.cornerRadius = 40 / 2

    addSubview(usernameButton)
    usernameButton.centerY(inView: profileImageView, leftAnchor: profileImageView.rightAnchor, paddingLeft: 8)

    addSubview(postImageView)
    postImageView.anchor(top: profileImageView.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 8)
    postImageView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 1).isActive = true

    configureActionButtons()

    addSubview(likesLabel)
    likesLabel.anchor(top: likesButton.bottomAnchor, left: leftAnchor, paddingTop: -4, paddingLeft: 8)

    addSubview(captionLabel)
    captionLabel.anchor(top: likesLabel.bottomAnchor, left: leftAnchor, paddingTop: 8, paddingLeft: 8)

    addSubview(postTimeLabel)
    postTimeLabel.anchor(top: captionLabel.bottomAnchor, left: leftAnchor, paddingTop: 8, paddingLeft: 8)
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

  func configureActionButtons(){
    let stackView = UIStackView(arrangedSubviews: [likesButton, commentButton, shareButton])
    stackView.axis = .horizontal
    stackView.distribution = .fillEqually

    addSubview(stackView)
    stackView.anchor(top: postImageView.bottomAnchor, width: 120, height: 50)
  }

}

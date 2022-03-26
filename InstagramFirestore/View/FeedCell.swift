
import UIKit

class FeedCell: UICollectionViewCell {

  // MARK: - Properties

  private let profileImageView = UIImageView = {
    let iv = UIImageView()
    iv.contentMode = .scaleAspectFit
    iv.clipsToBounds = true
    iv.isUserInteractionEnabled = true
    iv.image = #imageLiteral(resourceName: "venom-7")
    return iv
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

  // MARK: - Helpers

  func configureUI() {
    backgroundColor = .white

    addSubview(profileImageView)
    profileImageView.anchor(top: topAnchor, left: leftAnchor, paddingTop: 12, paddingLeft: 12)
    profileImageView.setDimensions(height: 40, width: 40)
    profileImageView.layer.cornerRadius = 40 / 2
  }

}

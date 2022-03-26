import UIKit

private let reuseIdentifier = "Cell"

class FeedController: UICollectionViewController {

  // MARK: - Properties

  // MARK: - Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()
    configureUI()
  }

  // MARK: - API

  // MARK: - Selectors

  // MARK: - Helpers

  func configureUI() {
    collectionView.backgroundColor = .white

    collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
  }
}


  // MARK: - UICollectionViewDataSource

extension FeedController {
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 5
  }

  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    cell.backgroundColor = .red
    return cell
  }
}

  // MARK: - UICollectionViewDelegateFlowLayout

extension FeedController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: view.frame.width, height: 200)
  }
}

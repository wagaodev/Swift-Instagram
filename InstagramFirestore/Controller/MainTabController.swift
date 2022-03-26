

import UIKit

class MainTabController: UITabBarController {
  
  // MARK: - Properties
  
  // MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureViewController()
    
  }
  
  // MARK: - API
  
  // MARK: - Selectors
  
  // MARK: - Helpers
  
  func configureViewController(){
    view.backgroundColor = .white
    let feed = FeedController()
    let search = SearchController()
    let imageSelector = ImageSelectorController()
    let notifications = NotificationController()
    let profile = ProfileController()

    
    viewControllers = [feed, search, imageSelector, notifications, profile]
  }
  
  func templateNavigationController(unselectedImage: UIImage, selectedImage: UIImage,
                                    rootViewController: UIViewController) -> UINavigationController {
    
  }
  
}

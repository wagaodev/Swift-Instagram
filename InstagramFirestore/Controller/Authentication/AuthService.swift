
import UIKit
import Firebase


struct AuthCredentials {
  let email: String
  let password: String
  let fullname: String
  let username: String
  let profileImage: UIImage
}


struct AuthService {
  static func registerUser(withCredentials credentials: AuthCredentials){
    print("DEBUG: Credentials are \(credentials)")
  }
}

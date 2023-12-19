import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.isTranslucent = false
        self.tabBar.backgroundColor = .white
        self.tabBar.tintColor = .systemBlue
        self.tabBar.unselectedItemTintColor = .gray
   
        setupTabs()
        
    }
    
    // MARK: Tab Setup
    private func setupTabs() {
        let first = self.createNav(with: "First game", and: UIImage(systemName: "gamecontroller.fill"), vc: FirstGameViewController())
        let second = self.createNav(with: "Second game", and: UIImage(systemName: "gamecontroller.fill"), vc: SecondGameViewController())
        let third = self.createNav(with: "Third game", and: UIImage(systemName: "gamecontroller.fill"), vc: ThirdGameViewController())
        
        self.setViewControllers([first, second, third], animated: true)
    }
    
    private func createNav(with title: String, and image: UIImage?, vc: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: vc)
        
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
        
        nav.isNavigationBarHidden = true
        return nav
    }

}

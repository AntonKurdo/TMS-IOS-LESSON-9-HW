import UIKit
import SnapKit

class FirstGameViewController: UIViewController {
    
    let size = 135
    
    let screenSize: CGRect = UIScreen.main.bounds
    
    var tabbarHeight: CGFloat = 0.0
    
    var circle: UIView = {
        let circle = UIView()
        circle.backgroundColor = UIColor.random()
        return circle
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        
        tabbarHeight = tabBarController!.tabBar.frame.size.height;
      
        circle.layer.cornerRadius = CGFloat(size / 2)
        circle.frame = CGRect(x: 100, y: 120, width: size, height: size)
  
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.touchTapped))
        circle.addGestureRecognizer(gesture)

        self.view.addSubview(circle)
    }
    
    @objc func touchTapped(sender: UITapGestureRecognizer) {
        let x = Int.random(in: 0...(Int(screenSize.width) - self.size))
        let y = Int.random(in: 50...(Int(screenSize.height ) - self.size - Int(self.tabbarHeight)))
        if sender.state == .ended {
            UIView.animate(withDuration: 0.14) {
                self.circle.frame = CGRect(x: x, y: y, width: self.size, height: self.size)
                self.circle.backgroundColor = UIColor.random()
            }
        }
    }
}





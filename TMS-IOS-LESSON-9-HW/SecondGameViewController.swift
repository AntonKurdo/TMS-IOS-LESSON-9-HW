import UIKit

class SecondGameViewController: UIViewController {
    let size = 56
    
    let squaresLimit = 3
    
    let screenSize: CGRect = UIScreen.main.bounds
    
    var tabbarHeight: CGFloat = 0.0
    
    var resetMode = false
    
    var button: UIButton = {
        let button = UIButton()
        button.setTitle("Start", for: .normal)
        button.layer.cornerRadius = 16
        button.backgroundColor = UIColor.random()
        button.layer.zPosition = CGFloat(Float.greatestFiniteMagnitude)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.5
        button.layer.shadowOffset = .zero
        button.layer.shadowRadius = 8
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemRed
        
        tabbarHeight = tabBarController?.tabBar.frame.size.height ?? 0;
        
        button.addAction(UIAction(handler: {_ in
            if !self.resetMode {
                self.setup()
                self.button.setTitle("Clear", for: .normal)
            } else {
                self.reset()
                self.button.setTitle("Start", for: .normal)
            }
            self.resetMode = !self.resetMode
        }), for: .touchUpInside)
        
        self.view.addSubview(button)
        button.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-12)
            make.width.equalTo(140)
            make.height.equalTo(60)
        }
    }
    
    private func setup() {
        let onePart = (Int(screenSize.height) - self.size - Int(self.tabbarHeight) - 100) / squaresLimit;
   
        for index in (0..<squaresLimit).indices {
            let yMin = onePart * (index) + (size);
            let yMax = onePart * (index + 1) + (index == squaresLimit - 1 ? 0 : size / 2)
        
            let x = Int.random(in: 0...(Int(screenSize.width) - self.size))
            let y = Int.random(in: yMin...yMax)
            
            let element  = createSquare(tag: index + 1);
            
            element.frame = CGRect(x: x, y: y, width: size, height: size)

            self.view.addSubview(element)
        }
    }
    
    private func reset() {
        for index in (0..<squaresLimit).indices {
            let square = self.view.viewWithTag(index + 1)!
            
            square.removeFromSuperview()
        }
    }
    
    private func createSquare(tag: Int) -> UIView {
        return  {
            let square = UIView()
            square.backgroundColor = UIColor.random()
            square.layer.cornerRadius = 8
            square.layer.shadowColor = UIColor.black.cgColor
            square.layer.shadowOpacity = 0.5
            square.layer.shadowOffset = .zero
            square.layer.shadowRadius = 8
            square.tag = tag
            return square
        }()
    }

}

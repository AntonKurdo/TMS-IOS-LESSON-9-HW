import UIKit

class SecondGameViewController: UIViewController {
    let size = 120
    
    let squaresLimit = 3
    
    let screenSize: CGRect = UIScreen.main.bounds
    
    var tabbarHeight: CGFloat = 0.0
    
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
            self.setup()
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
        for _ in 0..<squaresLimit {
            let x = Int.random(in: 0...(Int(screenSize.width) - self.size))
            let y = Int.random(in: 50...(Int(screenSize.height) - self.size - Int(self.tabbarHeight)))
            let element  = createSquare();
            
            element.frame = CGRect(x: x, y: y, width: size, height: size)
            
            self.view.addSubview(element)
        }
    }
    
    private func createSquare() -> UIView {
        return  {
            let square = UIView()
            square.backgroundColor = UIColor.random()
            square.layer.shadowColor = UIColor.black.cgColor
            square.layer.shadowOpacity = 0.5
            square.layer.shadowOffset = .zero
            square.layer.shadowRadius = 8
            return square
        }()
    }

}

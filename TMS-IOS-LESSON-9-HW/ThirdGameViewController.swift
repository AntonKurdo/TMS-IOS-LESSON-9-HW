import UIKit

class ThirdGameViewController: UIViewController {
    
    let screenSize: CGRect = UIScreen.main.bounds
    
    let circleSize: Double = 80
    
    

    let buttonWidth = 90
    let buttonHeight = 35
    
    let delta: Double = 35
    let animationDuration = 0.14
    
    var x: Double = 0.0
    var y: Double = 0.0

    let circle: UIView = {
        let circle = UIView()
        circle.backgroundColor = UIColor.random()
        return circle
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        
        x = (screenSize.width / 2) - circleSize / 2
        y = (screenSize.height / 2) - circleSize / 2
        circle.layer.cornerRadius = circleSize / 2
        circle.frame = CGRect(x:x , y:y , width: circleSize, height: circleSize)
        
        view.addSubview(circle)
        
        let topButton = createButton(title: "Top")

        view.addSubview(topButton)
        
        topButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-20)
            make.left.equalToSuperview().offset(5)
            make.width.equalTo(buttonWidth)
            make.height.equalTo(buttonHeight)
        }
 
        topButton.addAction(UIAction(handler: {_ in
            if self.y <= 25 {
                return
            }
            self.y -= self.delta
            UIView.animate(withDuration: self.animationDuration) {
                self.circle.frame = CGRect(x:self.x , y:self.y  , width: self.circleSize, height: self.circleSize)
            }
        
        }), for: .touchUpInside)
        
        let bottomButton = createButton(title: "Bottom")
        bottomButton.addAction(UIAction(handler: {_ in
            if self.y >= self.screenSize.height - self.tabBarController!.tabBar.frame.size.height - self.circleSize - Double(self.buttonHeight) - 20 {
                return
            }
            self.y += self.delta
            UIView.animate(withDuration: self.animationDuration) {
                self.circle.frame = CGRect(x:self.x , y:self.y  , width: self.circleSize, height: self.circleSize)
            }
        }), for: .touchUpInside)
        
        view.addSubview(bottomButton)
        
        bottomButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-20)
            make.left.equalTo(topButton).offset(buttonWidth + 15)
            make.width.equalTo(buttonWidth)
            make.height.equalTo(buttonHeight)
        }
        
        let leftButton = createButton(title: "Left")
        leftButton.addAction(UIAction(handler: {_ in
            if self.x <= 0 {
                return
            }
            self.x -= self.delta
            UIView.animate(withDuration: self.animationDuration) {
                self.circle.frame = CGRect(x:self.x , y:self.y  , width: self.circleSize, height: self.circleSize)
            }
            
     
        }), for: .touchUpInside)
        
        view.addSubview(leftButton)
        
        leftButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-20)
            make.left.equalTo(bottomButton).offset(buttonWidth + 15)
            make.width.equalTo(buttonWidth)
            make.height.equalTo(buttonHeight)
        }
        
        let rightButton = createButton(title: "Right")
        rightButton.addAction(UIAction(handler: {_ in
            if self.x >= (self.screenSize.width - self.circleSize) {
                return
            }
            self.x += self.delta
            UIView.animate(withDuration: self.animationDuration) {
                self.circle.frame = CGRect(x:self.x , y:self.y  , width: self.circleSize, height: self.circleSize)
            }
        }), for: .touchUpInside)
        
        view.addSubview(rightButton)
        
        rightButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-20)
            make.left.equalTo(leftButton).offset(buttonWidth + 15)
            make.width.equalTo(buttonWidth)
            make.height.equalTo(buttonHeight)
        }
        
    }
    
    private func createButton(title: String) -> UIButton {
        return {
            let button = UIButton()
            button.setTitle(title, for: .normal)
            button.layer.cornerRadius = 16
            button.backgroundColor = UIColor.random()
       
            return button
        }()
    }
}

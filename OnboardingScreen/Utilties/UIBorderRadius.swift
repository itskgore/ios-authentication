
import UIKit
func underLineTextField(myTextFeild:UITextField) {
    let bottomLine = CALayer()
    bottomLine.frame = CGRect(x: 0, y: myTextFeild.frame.height - 10,  width: myTextFeild.frame.width, height: 2)
    bottomLine.backgroundColor = UIColor.lightGray.cgColor
    myTextFeild.borderStyle = .none
    myTextFeild.layer.addSublayer(bottomLine)
    
}

func buttonShadow(btnHi: UIButton) {
    btnHi.layer.shadowColor = UIColor.black.cgColor
    btnHi.layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
    btnHi.layer.shadowRadius = 8
    btnHi.layer.shadowOpacity = 0.5
}



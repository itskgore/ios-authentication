import UIKit
import ImageIO
var asView : UIView?

class Loader {
    func startFunction(view: UIView) {
         asView = UIView(frame: view.bounds)
        asView?.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView(style: .large)
//        let imageLoader = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 70))
        ai.center = view.center
//        imageLoader.center = view.center
//        imageLoader.image = #imageLiteral(resourceName: "Default_pro")
        ai.startAnimating()
        asView?.addSubview(ai)
        view.addSubview(asView!)
        view.bringSubviewToFront(ai)
    }
    
    func removeSpinner(view: UIView) {
        asView?.removeFromSuperview()
        asView = nil
    }
    
}




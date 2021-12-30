//
//  UIView.swift
//  ImageToon
//
//  Created by Dayo Banjo on 12/29/21.
//

import UIKit

extension UIView {
    
    func applyGradient(colours: [UIColor]) -> CAGradientLayer {
        return self.applyGradient(colours: colours, locations: nil)
    }
    
    func applyGradient(colours: [UIColor], locations: [NSNumber]?) -> CAGradientLayer {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.locations = locations
        self.layer.insertSublayer(gradient, at: 0)
        return gradient
    }
    
    func generateTransparentButton(title : String, borderLineColor : UIColor = Colors.primaryTextColor.value) -> UIButton{
        let button = UIButton()
        button.backgroundColor = .clear
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(borderLineColor, for: .normal)
        button.setTitle(title, for: .normal)
        button.layer.borderColor = borderLineColor.cgColor
        return button
    }
    
    func generatePrimaryButton(text: String,
                               color: UIColor = UIColor(named: "primaryTextColor") ?? .white,
                               raduis : CGFloat = 28,
                               textColor : UIColor = UIColor(named: "primaryColor") ?? .black,
                               borderWidth : CGFloat = 0,
                               borderColor : UIColor = UIColor(named: "primaryColor") ??  .black,
                               fontSize : CGFloat = 17)-> UIButton{
        let button = UIButton()
        button.layer.cornerRadius = raduis
        button.backgroundColor = color
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(text, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.setTitleColor(textColor, for: .normal)
        return button
    }
    
    func generateUILabel(text: String,
                         color: UIColor = .clear,
                         fontSize : CGFloat = 16,
                         textColor : UIColor = Colors.primaryTextColor.value) -> UILabel{
        let label = UILabel()
        label.backgroundColor = color
        label.text = text
        label.textColor = textColor
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }
    
    func generateTextField(text: String,
                           color: UIColor = UIColor(named: "primaryTextColor") ?? .white,
                           raduis : CGFloat = 28,
                           textColor : UIColor = UIColor(named: "primaryColor") ?? .black,
                           borderWidth : CGFloat = 0,
                           borderColor : UIColor = UIColor(named: "primaryColor") ??  .black) -> UITextField{
        let textField = UITextField()
        textField.placeholder = text
        textField.textColor = textColor
        textField.layer.borderWidth = borderWidth
        textField.layer.borderColor = borderColor.cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 20))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        return textField
    }
    
    
    // Generate Image Button
    func generateImageButton (image: UIImage?) -> UIButton {
        let btn   = UIButton(type: UIButton.ButtonType.custom)
        btn.setImage(image?.withRenderingMode(.alwaysTemplate), for: .normal)
        btn.tintColor = .white
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }
    
    func addSubviews(_ views: UIView...) {
        views.forEach{addSubview($0)}
    }
    
    func generateImageView (src: String,  contentMode : ContentMode = .scaleAspectFit) -> UIImageView {
        let iv = UIImageView(image: UIImage(named: src))
        //iv.contentMode = contentMode
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv;
    }
    
    func generateImageViewWithDynamicRenderingMode (src: String,  contentMode : ContentMode = .scaleAspectFit,
                                                    tintColor : UIColor = Colors.colorAccent.value) -> UIImageView {
        let iv = UIImageView(image: UIImage(named: src)?.withRenderingMode(.alwaysTemplate))
        iv.tintColor = tintColor
        //iv.contentMode = contentMode
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv;
    }
    
    func makeCircular(){
        layer.masksToBounds = true
        layer.cornerRadius = frame.width/2
    }
    
    func addTapGesture(tapNumber: Int, target: Any, action: Selector) {
        let tap = UITapGestureRecognizer(target: target, action: action)
        tap.numberOfTapsRequired = tapNumber
        addGestureRecognizer(tap)
        isUserInteractionEnabled = true
    }
    
    func calculateViewSize (_ scrollView : UIScrollView) {
        var contentRect = CGRect.zero
        for view in scrollView.subviews {
            contentRect = contentRect.union(view.frame)
        }
        scrollView.contentSize = contentRect.size
    }
    
    func generateView() -> UIView{
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    func generateTextView(title : String = "") -> UITextView{
        let textView = UITextView()
        textView.text = title
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }
    
    // Border Radius
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    func transparentCornerBackground(radius : CGFloat ){
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
        self.backgroundColor = .black.withAlphaComponent(0.3)
    }
    
    func roundTopCorners(_ raduis: CGFloat){
        self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        self.clipsToBounds = true
        layer.cornerRadius = raduis
    }
    
    func generateProgressView(tintColor : UIColor = .black.withAlphaComponent(0.3), 
                              progressColor : UIColor = Colors.colorAccent.value) -> UIProgressView{
        let progressView  = UIProgressView(progressViewStyle: .default)
        progressView.trackTintColor = tintColor
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.progressTintColor = progressColor
        return progressView
    }
}

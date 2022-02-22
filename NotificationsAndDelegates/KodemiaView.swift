//
//  KodemiaView.swift
//  NotificationsAndDelegates
//
//  Created by Felipe Montoya on 2/21/22.
//

import UIKit


protocol KodemiaViewDelegate: AnyObject {
    var duration: Double { get set }
    func kodemiaViewWillTransitionToAnimation(for color: UIColor) -> Double //delay..
    func kodemiaViewDidChangedBackground()
}

class KodemiaView: UIView {
    
    public weak var delegate: KodemiaViewDelegate?
    
    public func animateToColor(_ color: UIColor) {
        let duration = delegate?.duration ?? 1.0
        let delay = delegate?.kodemiaViewWillTransitionToAnimation(for: color) ?? 0.25
        UIView.animate(withDuration: duration, delay: delay, options: .curveLinear) {
            self.backgroundColor = color
        } completion: { _ in
            self.delegate?.kodemiaViewDidChangedBackground()
        }
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

//
//  KVViewController.swift
//  NotificationsAndDelegates
//
//  Created by Felipe Montoya on 2/21/22.
//

import UIKit

class KVViewController: UIViewController {
    @objc var observedObject: MyObjectObservable!
    var observation: NSKeyValueObservation?
    
    private lazy var button: UIButton = {
        var button = UIButton()
        button.backgroundColor = .blue
        self.view.addSubview(button)
        button.setTitle("Change Color", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
//            button.heightAnchor.constraint(equalToConstant: 50.0),
//            button.widthAnchor.constraint(equalToConstant: 50.0),
            
        ])
        return button
    }()
    
    @objc func didPressedButton(){
        observedObject.color = .yellow
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        observedObject = MyObjectObservable()
        self.button.addTarget(self, action: #selector(didPressedButton), for: .touchUpInside)
        
        observation = observe(\.observedObject?.color, options: [.new, .old], changeHandler: { object, value in
            
            UIView.animate(withDuration: 2.5, delay: 0.5, options: UIView.AnimationOptions.curveEaseOut) { [weak self] in
                self?.view.backgroundColor = value.newValue!! //as? UIColor
            } completion: { [weak self] _ in
                self?.view.backgroundColor = value.oldValue!! // as! UIColor
            }
            
        })

        // Do any additional setup after loading the view.
    }


}

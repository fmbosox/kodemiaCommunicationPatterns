//
//  MyObject.swift
//  NotificationsAndDelegates
//
//  Created by Felipe Montoya on 2/21/22.
//

import Foundation
import UIKit

//API ....
//MVVM
//ViewModel ---> ViewController
class MyObjectObservable: NSObject {
    @objc dynamic var color: UIColor = .red
    var date = Date()
    var count = 2
}

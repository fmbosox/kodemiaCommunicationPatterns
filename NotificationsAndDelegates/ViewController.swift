//
//  ViewController.swift
//  NotificationsAndDelegates
//
//  Created by Felipe Montoya on 2/21/22.
//



import UIKit




/*NSNotificationCenter
 1. Create or listen to notification name A.K.A 'radio station'
 let myNotification = NSNotification.Name(rawValue: "KodemiaNotification")
 2. Set dispatcher A.K.A 'Radio Device'
 NotificationCenter.default
  
 3. post = emit signal (post)
 4. listen and respond to signal (add observer)
 */
class ViewController: UIViewController {
    
    var duration: Double = 2.0
    
    private var kodemiaView: KodemiaView?

    private lazy var tableView: UITableView = {
        let tv = UITableView(frame: self.view.frame)
        self.view.addSubview(tv)
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self

    }
    
    func pickColor() -> UIColor {
        switch Int.random(in: 1...5) {
        case 1: return .blue
        case 2: return .brown
        case 3: return .darkGray
        case 4: return .yellow
        default: return .red
        }
    }
}



extension ViewController: UITableViewDelegate {
    //Editar footers,headers, etc...
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        kodemiaView?.animateToColor(self.pickColor())
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 1
    }

    // Provide a cell object for each row.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Fetch a cell of the appropriate type.
        let cell = UITableViewCell()
        let kodemiaView = KodemiaView(frame: cell.contentView.frame)
        kodemiaView.delegate = self
        self.kodemiaView = kodemiaView
        // Configure the cell’s contents.
        cell.contentView.addSubview(kodemiaView)
        
        //register as delegate
        return cell
    }
    
    
}

extension ViewController: KodemiaViewDelegate {
   
    func kodemiaViewWillTransitionToAnimation(for color: UIColor) -> Double {
        switch color {
        case .blue: return Double.random(in: 1.2...3.5)
        case .red: return 2.5
        case .brown: return 1.5
        case .darkGray: return 0.0
        default: return 1.0
        }
    }
    
    func kodemiaViewDidChangedBackground() {
        UIView.animate(withDuration: 2.5, delay: 0.5, options: UIView.AnimationOptions.curveEaseOut) { [weak self] in
            self?.kodemiaView?.backgroundColor = .white
        } completion: { [weak self] _ in
//            self?.tableView.transform = CGAffineTransform.identity
        }

    }
    
    
}

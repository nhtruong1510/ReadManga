//
//  AlertManager.swift
//  ReadManga
//
//  Created by Truong Nguyen Huu on 10/4/24.
//

import Foundation
import UIKit

public enum BAlertType: Int {
    case ok = 0
    case yesNo
    case cancel
}

public enum BButtonResult: Int {
    case ok = 0
    case yes
    case no
    case cancel
}

private enum ActionTitle: String {
    case ok = "OK"
    case yes = "Yes"
    case no = "No"
    case cancel = "Cancel"
}

typealias alertTapHandler = (_ alertView: UIAlertController, _ button: BButtonResult) -> Void
typealias actionSheetTapHandler = (_ titleSelected: String, _ button: BButtonResult?) -> Void

class AlertManager: NSObject {
    static var isShowPoup = false
    
    class func showAlert(message: String, type: BAlertType, complete: alertTapHandler?) {
        showAlert(title: "", message: message, type: type, complete: complete)
    }
    
    class func showAlert(title: String, message: String, type: BAlertType, complete: alertTapHandler?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        guard !isShowPoup else { return }
        isShowPoup = true
        switch type {
        case .ok:
            let ok = UIAlertAction(title: ActionTitle.ok.rawValue, style: .destructive, handler: { _ in
                isShowPoup = false
                if let complete = complete {
                    complete(alert, .ok)
                }
            })
            alert.addAction(ok)
            
        case .yesNo:
            let yes = UIAlertAction(title: "OK", style: .destructive, handler: { _ in
                isShowPoup = false
                if let complete = complete {
                    complete(alert, .yes)
                }
            })
            
            let no = UIAlertAction(title: "Cancel", style: .default, handler: { _ in
                isShowPoup = false
                if let complete = complete {
                    complete(alert, .no)
                }
            })
            
            alert.addAction(yes)
            alert.addAction(no)
            
        case .cancel:
            let cancel = UIAlertAction(title: "Cancel", style: .destructive, handler: { _ in
                isShowPoup = false
                if let complete = complete {
                    complete(alert, .cancel)
                }
            })
            alert.addAction(cancel)
        }
        
        AppDelegate.shared.topMost?.present(alert, animated: true, completion: nil)
    }
    
    class func showAlertWithOKAndCancel(message: String, complete: alertTapHandler?) {
        showAlertWithOKAndCancel(title: "", message: message, complete: complete)
    }
    
    class func showAlertWithOKAndCancel(title: String, message: String, complete: alertTapHandler?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: ActionTitle.cancel.rawValue, style: .destructive, handler: { _ in
            if let complete = complete {
                complete(alert, .cancel)
            }
        })
        
        let ok = UIAlertAction(title: ActionTitle.ok.rawValue, style: .default, handler: { _ in
            if let complete = complete {
                complete(alert, .ok)
            }
        })
        alert.addAction(cancel)
        alert.addAction(ok)
        AppDelegate.shared.topMost?.present(alert, animated: true, completion: nil)
    }
}

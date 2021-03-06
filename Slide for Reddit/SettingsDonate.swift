//
//  SettingsDonate.swift
//  Slide for Reddit
//
//  Created by Carlos Crane on 2/17/19.
//  Copyright © 2019 Haptic Apps. All rights reserved.
//

import Anchorage
import BiometricAuthentication
import LicensesViewController
import MessageUI
import RealmSwift
import RLBAlertsPickers
import SDWebImage
import UIKit

class SettingsDonate: UIViewController, MFMailComposeViewControllerDelegate {
    
    static var changed = false
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        if ColorUtil.theme.isLight() && SettingValues.reduceColor {
            return .default
        } else {
            return .lightContent
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupBaseBarColors()
        navigationController?.setToolbarHidden(true, animated: false)
    }
    
    override func loadView() {
        super.loadView()
    }
    
    var cellsDone = false
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if !cellsDone {
            cellsDone = true
            doCells()
        }
    }
    
    var coffee = UILabel()
    var bagel = UILabel()
    var lunch = UILabel()

    func doCells(_ reset: Bool = true) {
        self.view.backgroundColor = ColorUtil.backgroundColor
        // set the title
        self.title = "Support Slide!"
        let aboutArea = UIView()
        let about = UILabel(frame: CGRect.init(x: 0, y: 0, width: self.view.frame.size.width, height: 30))
        about.font = UIFont.systemFont(ofSize: 15)
        aboutArea.backgroundColor = ColorUtil.foregroundColor
        about.textColor = ColorUtil.fontColor
        about.text = "Thank you for supporting Slide by being a Pro user! If you want to continue to support my work, feel free to leave me a tip 🍻"
        about.numberOfLines = 0
        about.textAlignment = .center
        about.lineBreakMode = .byClipping
        about.sizeToFit()
        
        bagel = UILabel(frame: CGRect.init(x: 0, y: 0, width: 100, height: 45))
        bagel.text = "Tip me $2.99"
        bagel.backgroundColor = GMColor.lightGreen300Color()
        bagel.layer.cornerRadius = 22.5
        bagel.clipsToBounds = true
        bagel.numberOfLines = 0
        bagel.lineBreakMode = .byWordWrapping
        bagel.textColor = .white
        bagel.font = UIFont.boldSystemFont(ofSize: 16)
        bagel.textAlignment = .center
        
        coffee = UILabel(frame: CGRect.init(x: 0, y: 0, width: 100, height: 45))
        coffee.text = "Buy me a coffee! (tip $4.99)"
        coffee.backgroundColor = GMColor.lightBlue300Color()
        coffee.layer.cornerRadius = 22.5
        coffee.clipsToBounds = true
        coffee.textColor = .white
        coffee.numberOfLines = 0
        coffee.lineBreakMode = .byWordWrapping
        coffee.font = UIFont.boldSystemFont(ofSize: 16)
        coffee.textAlignment = .center
        
        lunch = UILabel(frame: CGRect.init(x: 0, y: 0, width: 100, height: 45))
        lunch.text = "Buy me lunch! (tip $9.99)"
        lunch.backgroundColor = GMColor.red300Color()
        lunch.layer.cornerRadius = 22.5
        lunch.clipsToBounds = true
        lunch.textColor = .white
        lunch.numberOfLines = 0
        lunch.lineBreakMode = .byWordWrapping
        lunch.font = UIFont.boldSystemFont(ofSize: 16)
        lunch.textAlignment = .center

        bagel.addTapGestureRecognizer {
            IAPHandler.shared.purchaseMyProduct(index: 2)
            self.alertController = UIAlertController(title: "Processing your tip!\n\n\n", message: nil, preferredStyle: .alert)
            
            let spinnerIndicator = UIActivityIndicatorView(style: .whiteLarge)
            spinnerIndicator.center = CGPoint(x: 135.0, y: 65.5)
            spinnerIndicator.color = ColorUtil.fontColor
            spinnerIndicator.startAnimating()
            
            self.alertController?.view.addSubview(spinnerIndicator)
            self.present(self.alertController!, animated: true, completion: nil)
        }
        
        coffee.addTapGestureRecognizer {
            IAPHandler.shared.purchaseMyProduct(index: 3)
            self.alertController = UIAlertController(title: "Processing your tip!\n\n\n", message: nil, preferredStyle: .alert)
            
            let spinnerIndicator = UIActivityIndicatorView(style: .whiteLarge)
            spinnerIndicator.center = CGPoint(x: 135.0, y: 65.5)
            spinnerIndicator.color = ColorUtil.fontColor
            spinnerIndicator.startAnimating()
            
            self.alertController?.view.addSubview(spinnerIndicator)
            self.present(self.alertController!, animated: true, completion: nil)
        }

        lunch.addTapGestureRecognizer {
            IAPHandler.shared.purchaseMyProduct(index: 4)
            self.alertController = UIAlertController(title: "Processing your tip!\n\n\n", message: nil, preferredStyle: .alert)
            
            let spinnerIndicator = UIActivityIndicatorView(style: .whiteLarge)
            spinnerIndicator.center = CGPoint(x: 135.0, y: 65.5)
            spinnerIndicator.color = ColorUtil.fontColor
            spinnerIndicator.startAnimating()
            
            self.alertController?.view.addSubview(spinnerIndicator)
            self.present(self.alertController!, animated: true, completion: nil)
        }

        aboutArea.addSubview(bagel)
        aboutArea.addSubview(coffee)
        aboutArea.addSubview(lunch)
        aboutArea.addSubview(about)

        bagel.horizontalAnchors == aboutArea.horizontalAnchors + 8
        coffee.horizontalAnchors == aboutArea.horizontalAnchors + 8
        lunch.horizontalAnchors == aboutArea.horizontalAnchors + 8

        bagel.topAnchor == about.bottomAnchor + 16
        coffee.topAnchor == bagel.bottomAnchor + 12
        lunch.topAnchor == coffee.bottomAnchor + 12
        bagel.heightAnchor == 45
        coffee.heightAnchor == 45
        lunch.heightAnchor == 45

        about.horizontalAnchors == aboutArea.horizontalAnchors + 12
        about.topAnchor == aboutArea.topAnchor + 12
        
        let rect = about.textRect(forBounds: CGRect(x: 0, y: 0, width: self.view.frame.size.width - 24, height: CGFloat.greatestFiniteMagnitude), limitedToNumberOfLines: 0)
        
        self.view.addSubview(aboutArea)
        self.preferredContentSize = CGSize(width: self.view.frame.size.width, height: CGFloat(45 * 3 + 12 * 3 + 16 + rect.height + 16))
        aboutArea.edgeAnchors == self.view.edgeAnchors
    }
    
    var alertController: UIAlertController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        IAPHandler.shared.fetchAvailableProducts()
        IAPHandler.shared.getItemsBlock = {(items) in
            
            if items.isEmpty || items.count != 2 {
                let alertView = UIAlertController(title: "Slide could not connect to Apple's servers", message: "Something went wrong connecting to Apple, please try again soon! Sorry for any inconvenience this may have caused", preferredStyle: .alert)
                let action = UIAlertAction(title: "Close", style: .cancel, handler: { (_) in
                })
                alertView.addAction(action)
                self.present(alertView, animated: true, completion: nil)
            }
        }
        IAPHandler.shared.purchaseStatusBlock = {[weak self] (type) in
            guard let strongSelf = self else { return }
            if type == .purchased {
                strongSelf.alertController?.dismiss(animated: true, completion: nil)
                let alertView = UIAlertController(title: "", message: type.message(), preferredStyle: .alert)
                let action = UIAlertAction(title: "Close", style: .cancel, handler: { (_) in
                    self?.dismiss(animated: true, completion: nil)
                })
                alertView.addAction(action)
                strongSelf.present(alertView, animated: true, completion: nil)
                SettingValues.isPro = true
                UserDefaults.standard.set(true, forKey: SettingValues.pref_pro)
                UserDefaults.standard.synchronize()
                SettingsPro.changed = true
            }
        }
        
        IAPHandler.shared.errorBlock = {[weak self] (error) in
            guard let strongSelf = self else { return }
            strongSelf.alertController?.dismiss(animated: true, completion: nil)
            if error != nil {
                let alertView = UIAlertController(title: "Something went wrong!", message: "Your account has not been charged.\nError: \(error!)\n\nPlease send me an email if this issue persists!", preferredStyle: .alert)
                let action = UIAlertAction(title: "Close", style: .cancel, handler: { (_) in
                })
                alertView.addAction(action)
                alertView.addAction(UIAlertAction.init(title: "Email me", style: .default, handler: { (_) in
                    if MFMailComposeViewController.canSendMail() {
                        let mail = MFMailComposeViewController()
                        mail.mailComposeDelegate = strongSelf
                        mail.setToRecipients(["hapticappsdev@gmail.com"])
                        mail.setSubject("Slide Pro Purchase")
                        mail.setMessageBody("<p>Apple ID: \nName:\n\n</p>", isHTML: true)
                        
                        strongSelf.present(mail, animated: true)
                    }
                }))
                strongSelf.present(alertView, animated: true, completion: nil)
            } else {
                let alertView = UIAlertController(title: "Something went wrong!", message: "Your account has not been charged! \n\nPlease send me an email if this issue persists!", preferredStyle: .alert)
                let action = UIAlertAction(title: "Close", style: .cancel, handler: { (_) in
                })
                alertView.addAction(action)
                alertView.addAction(UIAlertAction.init(title: "Email me", style: .default, handler: { (_) in
                    if MFMailComposeViewController.canSendMail() {
                        let mail = MFMailComposeViewController()
                        mail.mailComposeDelegate = strongSelf
                        mail.setToRecipients(["hapticappsdev@gmail.com"])
                        mail.setSubject("Slide Pro Purchase")
                        mail.setMessageBody("<p>Apple ID: \nName:\n\n</p>", isHTML: true)
                        
                        strongSelf.present(mail, animated: true)
                    }
                }))
                strongSelf.present(alertView, animated: true, completion: nil)
            }
        }
        
        IAPHandler.shared.restoreBlock = {[weak self] (restored) in
            guard let strongSelf = self else { return }
            strongSelf.alertController?.dismiss(animated: true, completion: nil)
            if restored {
                SettingValues.isPro = true
                UserDefaults.standard.set(true, forKey: SettingValues.pref_pro)
                UserDefaults.standard.synchronize()
                SettingsPro.changed = true
                let alertView = UIAlertController(title: "", message: "Thank you for the tip!", preferredStyle: .alert)
                let action = UIAlertAction(title: "Close", style: .cancel, handler: { (_) in
                    self?.dismiss(animated: true, completion: nil)
                })
                alertView.addAction(action)
                strongSelf.present(alertView, animated: true, completion: nil)
            } else {
                let alertView = UIAlertController(title: "Something went wrong!", message: "Slide Pro could not be restored! Make sure you purchased Slide on the same Apple ID as you purchased Slide Pro on. Please send me an email if this issue persists!", preferredStyle: .alert)
                let action = UIAlertAction(title: "Close", style: .cancel, handler: { (_) in
                })
                alertView.addAction(action)
                alertView.addAction(UIAlertAction.init(title: "Email me", style: .default, handler: { (_) in
                    if MFMailComposeViewController.canSendMail() {
                        let mail = MFMailComposeViewController()
                        mail.mailComposeDelegate = strongSelf
                        mail.setToRecipients(["hapticappsdev@gmail.com"])
                        mail.setSubject("Slide Pro Restsore")
                        mail.setMessageBody("<p>Apple ID: \nName:\n\n</p>", isHTML: true)
                        
                        strongSelf.present(mail, animated: true)
                    }
                }))
                strongSelf.present(alertView, animated: true, completion: nil)
            }
        }
        
    }
}

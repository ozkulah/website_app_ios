//
//  ViewController.swift
//  Website app
//
//  Created by Ahmet Ozkul on 2020-08-21.
//  Copyright © 2020 Ozkulah. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController , WKUIDelegate{

    @IBOutlet var webView: WKWebView!
    
    override func viewDidLoad() {
                   super.viewDidLoad()
                    NotificationCenter.default.addObserver(self, selector: #selector(didBecomeActive), name: UIApplication.didBecomeActiveNotification, object: nil)
                    //NotificationCenter.default.addObserver(self, selector: #selector(willEnterForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
                    
                   
               }
            @objc func didBecomeActive() {
                print("did become active")
                run_website()
            }

            @objc func willEnterForeground() {
                print("will enter foreground")
                
            }
            
            func run_website(){
                if Reachability.isConnectedToNetwork()
                {
                    print("Internet connected")
                    let url = URL(string: "https://www.websiteaddress.se/")
                    let myRequest = URLRequest(url: url!)
                    webView.load(myRequest)
                }
                else
                {
                    self.Alert(Message: "Vi behöver internetuppkoppling för att tillhandahålla tjänster i den här applikationen")
                }
            }
            override func loadView(){
               let webConfiguration = WKWebViewConfiguration()
               webView = WKWebView(frame: .zero, configuration: webConfiguration)
               webView.allowsLinkPreview = false
               webView.uiDelegate = self
               view = webView
            }

            
            func Alert(Message: String) {
                let alert = UIAlertController(title: "Ej Internet", message: Message, preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
    }

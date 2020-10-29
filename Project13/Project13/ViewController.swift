//
//  ViewController.swift
//  Project13
//
//  Created by Алтын on 10/29/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://www.amiami.com/")!
        let request = URLRequest(url: url)
        self.webView.loadRequest(request)
    }


}



//
//  ArticleVC.swift
//  News App
//
//  Created by Anna Sibirtseva on 23/01/2021.
//

import UIKit
import WebKit

class ArticleVC: UIViewController {
    
    @IBOutlet weak var articleWebView: WKWebView!
    
    var article: Article?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let articleUrl = article?.url, let url = URL(string: articleUrl){
            let request = URLRequest(url: url)
            articleWebView.load(request)
        }
    }
}

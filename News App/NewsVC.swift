//
//  NewsVC.swift
//  News App
//
//  Created by Anna Sibirtseva on 22/01/2021.
//

import UIKit
import Alamofire

class NewsVC: UICollectionViewController {
    
    var articles = [Article]()

    override func viewDidLoad() {
        super.viewDidLoad()
        customizeNavBar()
        getArticles()
    }
    
    private func customizeNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barTintColor  = .systemOrange // for small titles
        navigationController?.view.backgroundColor = .systemOrange // for large titles
    }
}

//MARK:  - Networking

extension NewsVC {
    
    func getArticles(){
        let parameters: Parameters = ["country": "us",
                                      "apiKey": "aa2285b0478b477eb56705d0393a34f6"]
        AF.request("http://newsapi.org/v2/top-headlines", parameters: parameters).responseData { (response) in
            guard let data = response.data else { return }
            
            do {
//                let json = try JSONSerialization.jsonObject(with: data, options: [])
//                print(json)
                let topHeadlinesResponse = try JSONDecoder().decode(TopHeadlinesResponse.self, from: data)
                self.articles = topHeadlinesResponse.articles
                self.collectionView?.reloadData()
                
            } catch {
                print(error)
            }
        }
    }
}

//MARK:  - FlowLayout

extension NewsVC: UICollectionViewDelegateFlowLayout {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = (collectionView.frame.width - 2) / 2
        let height: CGFloat = 240
        let size = CGSize(width: width, height: height)
        return size
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ArticleCell", for: indexPath) as? ArticleCell else { return UICollectionViewCell() }
        let article = articles[indexPath.item]
        cell.populate(with: article)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let article = articles[indexPath.item]
        performSegue(withIdentifier: "segue.Main.newsToArticle", sender: article)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if let articleVC = segue.destination as? ArticleVC,
           let article = sender as? Article {
            articleVC.article = article
        }
    }
}

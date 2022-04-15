

import Foundation

struct NewsViewModel {
    let article: Article
    
    var author: String {
        return article.author ?? "No Author"
    }
    
    var title: String {
        return article.title ?? "No Title"
    }
    
    var description: String {
        return article.description ?? ""
    }
    
    var url: String {
        return article.url ?? ""
    }
    
    var urlToImage: String {
        return article.urlToImage ?? "No image"
    }
}


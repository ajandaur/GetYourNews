
import Foundation

class NewsListViewModel {
    
    var newsVM = [NewsViewModel]()
    
    let reuseID = "news"
    
    func getNews(completion: @escaping ([NewsViewModel]) -> Void) {
        NetworkManager.shared.getTopNews { (news) in
            guard let news = news else {
                return
            }
            let newsVM = news.map(NewsViewModel.init)
            
            // do this on the main thread since it's a "UI thing" 
            DispatchQueue.main.async {
                self.newsVM = newsVM
                completion(newsVM)
            }
        }
    }
}

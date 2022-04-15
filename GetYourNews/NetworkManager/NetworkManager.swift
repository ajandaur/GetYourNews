
import Foundation

class NetworkManager {
    let imageCache = NSCache<NSString, NSData>()
    
    static let shared = NetworkManager()
    
    private init() {}
    
    private let baseURL = "https://newsapi.org/v2/"
    private let TopHeadlineUS = "top-headlines?country=us"
    
    // TODO: Pick up different URL strings for different article categories
    func getTopNews(completion: @escaping ([Article]?) -> Void) {
        let urlString = "\(baseURL)\(TopHeadlineUS)&apikey=\(APIKey.key)"
        
        
        guard let url = URL(string: urlString) else {
            print("There was an error with the url string")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil, let data = data else {
                completion(nil)
                return
            }
            
            let newsContainer = try? JSONDecoder().decode(NewsContainer.self, from: data)

            newsContainer == nil ? completion(nil) : completion(newsContainer!.articles)
        }.resume()
    }
    
    // MARK: - Get Image Networking
    
    func getArticleImage(urlString: String, completion: @escaping (Data?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        if let cachedImage = imageCache.object(forKey: NSString(string: urlString)) {
            completion(cachedImage as Data)
            
        } else {
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard error == nil, let data = data else {
                    completion(nil)
                    return
                }
                
                self.imageCache.setObject(data as NSData, forKey: NSString(string: urlString))
                completion(data)
            }
            .resume()
        }
    }
}

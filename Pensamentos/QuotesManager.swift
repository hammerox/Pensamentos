import Foundation

class QuotesManager {
    
    var quotes: [Quote]
    static let shared: QuotesManager = QuotesManager()
    
    private init() {
        let fileURL = Bundle.main.url(forResource: "quotes", withExtension: "json")!
        let jsonData = try! Data(contentsOf: fileURL)
        quotes = try! JSONDecoder().decode([Quote].self, from: jsonData)
    }
    
    func getRandomQuote() -> Quote {
        let index = Int(arc4random_uniform(UInt32(quotes.count)))
        return quotes[index]
    }
    
    func save(quote: Quote) {
        quotes.append(quote)
    }
}

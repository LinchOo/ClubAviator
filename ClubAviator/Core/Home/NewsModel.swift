import SwiftUI

struct NewsModel: Identifiable {
    var id = UUID().uuidString
    var date: String
    var title: String
    var info: String
    var description: String
    var imageName: String
}
class NewsViewModel: ObservableObject {
    @Published var newsSheet: NewsModel? = nil
    @Published var news: [NewsModel]
    
    init() {
        let news = NewsDataService.newsDB
        self.news = news
    }
}

class NewsDataService {
    
    static let newsDB: [NewsModel] = [
        NewsModel(date: "8.09.2023", title: "First days of Autumn", info: "Discont on bar and kitchen, giveaways and prizes. Let's celebrate togather!", description: """
📅 Date: 8.09.2023
                  
What to expect:

🎶 Live music with special quest who start this party.
Some funny things are in.
🎁 Giveaways and Prizes
Enjoy the first days of autumn with 10% discont on bar, and 15% discont on entertainment
""", imageName: "discont-10"),
        
        NewsModel(date: "27.08.2023", title: "Last Summer Party", info: "Let's spend this summer in the last party, discounts on all cocktails, special guest included. \n", description: """
📅 Date: 19.08.2023

What to expect:

🎶 Live Music: Our stage will come alive with the electrifying beats of the city's best Bands! Get ready to dance the night away to hot rhythms and this season's chart-toppers.

🍹 Refreshing Cocktails: Our bartenders will whip up unique summer cocktails that will make you forget the chill and embrace the sunset in an unmatched atmosphere.

🎁 Giveaways and Prizes: Take part in our contests and raffles for a chance to win incredible prizes, including free cocktails, tickets to upcoming events, and much more!

Invite your friends, family, and everyone who appreciates life's brightest moments. See you at the bar for the last summer bash!
""", imageName: "coctaile"),
        NewsModel(date: "19.08.2023", title: "Whiskey vs Rum", info: "Who is the better? Enjoy the taste of your favorite drinks at a discounted price and a special menu.\n", description: """
📅 Date: 19.08.2023

What to expect:

🥃 The secret recipe for the evening's success - unique cocktails with whiskey and rum, crafted by our talented bartenders. They will recreate the atmosphere of the collision between two great world beverages right in your glass.

🏴‍☠️ Direct tasting of select varieties of whiskey and rum from different corners of the world. You'll be able to savor their distinct aromas and uncover the secrets of production.

🎶 Live music, it will be hot and lively!

🍔 Gastronomic paradise - exquisite appetizers and dishes specifically chosen to harmonize with whiskey and rum.

💃 Dance until the morning hours to the sounds of the biggest hits and musical surprises of the night. Let loose on the dance floor with fellow enthusiasts!

🏆 Contests and prizes from the sponsors of the evening. Showcase your knowledge about whiskey and rum, win unique prizes and gifts.

Don't miss the chance to immerse yourself in the world of aristocratic taste and discover who will emerge as the true king of the night - whiskey or rum.

""", imageName: "whiskey"),
    NewsModel(date: "04.08.2023", title: "Bear Day", info: "We invite you to a bright event that will give you a lot of joy, fun and, of course, delicious beer!", description: """
📅 Date: 04.08.2023

What to expect:

🍻 A rich selection of beer varieties: from classic to exotic flavors.
🎶 Live music and performances by top artists to create an unforgettable atmosphere.
🍔 Treats and snacks perfectly paired with cold foamy drinks.
🎁 Giveaways, contests, and prizes – every guest becomes a part of the lively games!
📸 Photo zone with beer-themed props for vibrant photos and memories.

Don't miss the opportunity to celebrate this day among like-minded individuals, exchange experiences in evaluating beer tastes, and simply have a fantastic time in the ambiance of a true celebration!

Join us on this special day and immerse yourself in the spirit of beer culture! We look forward to seeing you at the Beer Day Celebration! 🍻
"""
              , imageName: "BearDay")
        
    ]
    
}

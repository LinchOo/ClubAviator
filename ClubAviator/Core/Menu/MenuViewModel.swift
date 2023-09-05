import Foundation

class MenuViewModel: ObservableObject {

    @Published var services: [ServicesModel]
    init() {
        let services = MenuDataService.servicesDB
        self.services = services
    }
}
class MenuDataService {
    static let shared = MenuDataService()
    
    
    static let servicesDB: [ServicesModel] = [
        ServicesModel(imgName: "pool-table", name: "Pool", description: "Classic snooker tables, and American Pool\nDiscover the true essence of billiard artistry.", price: ""),
        ServicesModel(imgName: "darts", name: "Darts", description: "Big Round, American cricket, 501\nCompete in skillfully hitting the most valuable sectors of the target.  ", price: ""),
        ServicesModel(imgName: "livemusic", name: "Live music", description: "New band every weekend\nEnjoy the true music - live music", price: ""),
        ServicesModel(imgName: "bar-counter", name: "Bar", description: "Tea, coffee, juice, beer, cocktails and more\nEnjoy your favorite drinks in our bar.", price: ""),
        ServicesModel(imgName: "kitchen", name: "Kitchen", description: "From snacks to grill\nOnly the most delicious food for every taste, our chef will be able to convince you.", price: "")
        ]
}

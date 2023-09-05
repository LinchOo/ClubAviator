import SwiftUI

struct NewsSheetView: View {
    @EnvironmentObject var newsViewModel: NewsViewModel
    
    let news: NewsModel
    var body: some View {
        VStack{
            Image(news.imageName)
                .resizable()
                .scaledToFit()
                .overlay(backButton, alignment: .topTrailing)
            Text(news.title)
                .font(.system(size: 30))
                .foregroundColor(.white)
            Divider()
            ScrollView{
                Text(news.description)
                    .padding()
            }
            Spacer()
        }
        .background(Color.brown)
        .ignoresSafeArea()
        
    }
    private var backButton: some View {
        Button{
            newsViewModel.newsSheet = nil
        }label: {
            Image(systemName: "xmark")
                .font(.headline)
                .padding()
                .cornerRadius(4)
                .shadow(radius: 4)
                .padding()
        }
    }
}

import SwiftUI

struct NewsCellView: View {
    @EnvironmentObject var newsViewModel: NewsViewModel
    @State var news: NewsModel
    var body: some View {
        VStack{
            Image(news.imageName)
                .resizable()
                .scaledToFit()
            Text(news.title)
                .font(.system(size: 30, weight: .bold, design: .serif))
                .minimumScaleFactor(0.7)
                .lineLimit(1)
            Divider()
            Text(news.info)
                .padding(.horizontal)
                .opacity(0.7)
            Spacer()
            HStack{
                Text(news.date)
                    .opacity(0.7)
                Spacer()
                Button{
                    newsViewModel.newsSheet = news
                }label: {
                    Label("more", systemImage: "arrowshape.zigzag.right")
                        .foregroundColor(.white)
                }
            }
            .padding(.horizontal)
            Spacer()
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
    }
}

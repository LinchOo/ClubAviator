import SwiftUI

struct HomeView: View {
    @State var isHide: Bool = false
    @EnvironmentObject var newsViewModel: NewsViewModel
    @State var selectedNews: String = "discont-10"
    var body: some View {
        VStack{
            Spacer()
            VStack{
                TabView(selection: $selectedNews){
                    ForEach(newsViewModel.news){ news in
                        NewsCellView(news: news)
                            .environmentObject(newsViewModel)
                            .tag(news.imageName)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
            }
            .overlay(alignment: .bottom) {
                HStack(spacing: 15) {
                    ForEach(newsViewModel.news) {news in
                        Capsule()
                            .fill(Color.white)
                            .frame(width: selectedNews == news.imageName ? 15 : 7 ,height: 7)
                    }
                }
            }
            .frame(maxWidth:.infinity,maxHeight: 450)
            .background(.ultraThinMaterial.opacity(0.7))
            .cornerRadius(35)
            .padding(.horizontal, 30)
            .opacity(isHide ? 0 : 1)
            Spacer()
            Button{
                isHide.toggle()
            }label: {
                Text("*")
                    .padding()
                    .font(.system(size: 50))
                    .clipShape(Capsule())
                    .foregroundColor(.white)
            }
            .padding(.bottom,65)
            
        }
        .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height)
        .background{
            Image("bg")
                .resizable()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .ignoresSafeArea()
        }
        .sheet(item: $newsViewModel.newsSheet, content: { news in
            NewsSheetView(news: news)
                .environmentObject(newsViewModel)
        })
    }
}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(NewsViewModel())
            .preferredColorScheme(.dark)
    }
}

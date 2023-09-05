import SwiftUI
import QRCode

enum Tab: String, CaseIterable {
    case news = "news"
    case discont = "discont"
    case menu = "menu"
    var index: CGFloat {
        return CGFloat(Tab.allCases.firstIndex(of: self) ?? 0)
    }
    static var count: CGFloat {
        return CGFloat(Tab.allCases.count)
    }
}

struct MainTab: View {
    
    @State var selectedTab: Tab = .news
    @State var curveAxis: CGFloat = 0
    @StateObject var viewModelUser = userViewModel()
    @StateObject var viewModelNews = NewsViewModel()
    
    init(){ UITabBar.appearance().isHidden = true}
    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $selectedTab)
            {
                HomeView()
                    .tag(Tab.news)
                    .environmentObject(viewModelNews)
                AccountView()
                    .tag(Tab.discont)
                    .environmentObject(viewModelUser)
                MenuView()
                    .tag(Tab.menu)
            }
            
            .clipShape(
                CustomTabCurve(curveAxis: curveAxis)
            )
            .padding(.bottom, -90)
            HStack{
                TabButtons()
            }
            .frame(height: 50)
            .padding(.horizontal,35)
        }
        .onAppear{
            print("ENTER")
        }
        .preferredColorScheme(.dark)
        .background(Color.brown)
        .ignoresSafeArea(.all, edges: .all)
        .overlay(alignment: .top, content: {
            ZStack {
                Text("Club Aviator")
                    .font(.system(size: 40, weight: .bold, design: .serif))
                    .foregroundColor(.brown)
                    .shadow(color: .black, radius: 5)
                    .zIndex(0)
                if viewModelUser.auth.currentUser == nil {
                    AuthView()
                        .environmentObject(viewModelUser)
                        .zIndex(1)
                }
            }
            .padding(.bottom,10)
        })
    }
    @ViewBuilder
    func TabButtons() -> some View{
        ForEach(Tab.allCases, id: \.self) { tab in
            GeometryReader { proxy in
                Button{
                    withAnimation {
                        selectedTab = tab
                        curveAxis = proxy.frame(in: .global).midX
                    }
                }label: {
                    VStack{
                        Image(tab.rawValue)
                            .resizable()
                            .renderingMode(.template)
                            .scaledToFit()
                            .foregroundColor(.white)
                            .frame(width: 35,height: 35)
                            .background{
                                Circle()
                                    .fill(Color.brown)
                                    .frame(width: 45, height: 45)
                                
                            }
                            .offset(y: selectedTab == tab ? -25 : 0)
                        Text(tab.rawValue)
                            .foregroundColor(.white)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .onAppear{
                    if curveAxis == 0 && tab == .news {
                        curveAxis = proxy.frame(in: .global).midX
                    }
                }
            }
            .frame(height: 40)
        }
    }
}
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}
struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
struct MainTab_Previews: PreviewProvider {
    static var previews: some View {
        MainTab()
    }
}

import SwiftUI

struct MenuView: View {
    @StateObject var viewModel = MenuViewModel()
    @State var selectedTab: String = "Pool"
    @State var offSet: CGFloat = 0
    @Namespace var animationIndicator
    
    var body: some View {
        VStack{
            TabView(selection: $selectedTab){
                ForEach(viewModel.services){ services in
                    VStack{
                        Text(services.name)
                            .font(.system(size: 25, weight: .black, design: .serif))
                            .padding()
                        Image(services.imgName)
                            .resizable()
                            .scaledToFit()
                            .padding()
                            .padding(.horizontal, 50)
                        Text("Description:")
                            .padding(.top,15)
                            .opacity(0.7)
                            .font(.system(size: 13))
                        Text(services.description)
                            .padding(.horizontal)
                            .padding(.vertical,5)
                            .opacity(0.9)
                            .multilineTextAlignment(.center)
                        Spacer()
                    }
                    .tag(services.name)
                }
            }
            .frame(maxHeight: UIScreen.main.bounds.height - 200)
            .background(.ultraThinMaterial)
            .cornerRadius(35)
            .padding(.horizontal,30)
            .padding(.top,40)
            .tabViewStyle(.page(indexDisplayMode: .never))
            .overlay(alignment: .bottom) {
                HStack(spacing: 15) {
                    ForEach(viewModel.services) {tab in
                        Capsule()
                            .fill(Color.white)
                            .frame(width: selectedTab == tab.name ? 15 : 7 ,height: 7)
                    }
                .offset(y: 25)
                }
            }
            Spacer()
        }
        .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height)
        .background{
            Image("bg")
                .resizable()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .ignoresSafeArea()
        }
//        .background{
//            Image("bg")
//                .resizable()
//        }
//
    }
}
struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

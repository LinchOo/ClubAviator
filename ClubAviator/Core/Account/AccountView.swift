import SwiftUI
import QRCode

struct AccountView: View {
    @EnvironmentObject var viewModel: userViewModel
    @State var isSettings: Bool = false
    @State var isHistory: Bool = false
    @State var isPromocode: Bool = false
    
    private let pastboard = UIPasteboard.general
    var body: some View {
        VStack {
            VStack(spacing:20){
                
                VStack{
                    header
                }
                .frame(width: 300)
                QRCodeDocumentUIView(document: viewModel.userQrCode!)
                    .frame(width: 300, height: 300)
                    .cornerRadius(15)
//                    .background(.ultraThinMaterial.opacity(1))
                    .background(Color.brown)
                    .cornerRadius(15)
                HStack{
                    Button{
                        withAnimation {
                            isSettings.toggle()
                        }
                        
                    }label: {
                        Text("Settings")
                            .foregroundColor(.white)
                            .padding()
                            .background(.ultraThinMaterial.opacity(0.6))
                            .clipShape(Capsule())
                    }
                    Spacer()
                    Button{
                        withAnimation {
                            isHistory.toggle()
                        }
                        
                    }label: {
                        Text("History")
                            .foregroundColor(.white)
                            .padding()
                            .background(.ultraThinMaterial.opacity(0.6))
                            .clipShape(Capsule())
                    }
                    Spacer()
                    Button{
                        isPromocode.toggle()
                    }label: {
                        Text("Code")
                            .foregroundColor(.white)
                            .padding()
                            .background(.ultraThinMaterial.opacity(0.6))
                            .clipShape(Capsule())
                    }
                }
            }
            .padding(.top, 40)
            .frame(width: 300)
            Spacer()

        }
        .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height)
        .background{
            Image("bg")
                .resizable()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .ignoresSafeArea()
        }
        .overlay(content: {
            if isSettings{
                SettingsView(isSettings: $isSettings)
                    .environmentObject(viewModel)
            }
            if isHistory{
                HistoryView(isHistory: $isHistory)
                    .environmentObject(viewModel)
            }
            if isPromocode{
                PromoCodeView(isPromocode: $isPromocode)
                    .environmentObject(viewModel)
            }
    })
        
    }
    
    private var header: some View{
        HStack{
            HStack{
                Button {
                    pastboard.string = viewModel.auth.currentUser?.uid
                } label: {
                    Label("referral code", systemImage: "doc.on.doc")
                        .foregroundColor(.white)
                }
            }
            .padding()
            .background(.ultraThinMaterial.opacity(0.6))
            .clipShape(Capsule())
            Spacer()
            HStack{
                Text("\(viewModel.points)")
                    .foregroundColor(.white)
                Text("points")
                    .foregroundColor(.white.opacity(0.6))
                
            }
            .padding()
            .background(.ultraThinMaterial.opacity(0.6))
            .clipShape(Capsule())
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        MainTab()
    }
}

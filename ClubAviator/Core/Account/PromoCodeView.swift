import SwiftUI

struct PromoCodeView: View {
    @Binding var isPromocode: Bool
    @State var code: String = ""
    @State var isAlert: Bool = false
    @EnvironmentObject var viewModel: userViewModel
    
    var wrongCode = "Wrong Code"
    var textCode = "Enter your Promo Code"
    
    var body: some View {
        VStack{
            promoSection
        }
        .frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height)
        .background(.ultraThinMaterial)
        .overlay(alignment: .center, content: {
            if isAlert{
                alertWrongCode
            }
        })
        .ignoresSafeArea()
        
    }
    private var alertWrongCode: some View{
        VStack{
            HStack{
                Text("Wrong Code")
                    .padding(.vertical, 10)
                    .foregroundColor(.white)
            }
            .frame(width: 250)
            .background(.brown)
            HStack{
                Spacer()
                Button{
                    withAnimation{
                        isAlert.toggle()
                    }
                }label: {
                    Text("OK")
                        .foregroundColor(.blue.opacity(0.5))
                }
                Spacer()
            }
            .padding(.vertical, 10)
            .frame(width: 250)
            .background(.brown)
        }
        .frame(width: 250, height: 150)
        .background(.ultraThinMaterial)
        .cornerRadius(15)
        .shadow(color:  .white, radius: 1, x: 1, y: 1)
        .shadow(color:  .white, radius: 1, x: -1, y: -1)

        
    }
    private var promoSection: some View {
                VStack{
                    HStack{
                        Text("Enter Your Promo Code")
                            .padding(.vertical, 10)
                            .foregroundColor(.white)
                    }
                    .frame(width: 250)
                    .background(.brown)
                    TextField("mWdsE-Vo5I3-zTjg4", text: $code)
                        .padding(.leading,50)
                        .padding(.vertical)
                    HStack{
                        Spacer()
                        Button{
                            promoActivate()
                        }label: {
                            Text("Confirm")
                                .foregroundColor(.white)
                        }
                        Spacer()
                        Divider()
                            .frame(height: 15)
                        Spacer()
                        Button{
                            withAnimation{
                                isPromocode.toggle()
                            }
                        }label: {
                            Text("Cancel")
                                .foregroundColor(.red)
                        }
                        Spacer()
                    }
                    .padding(.vertical, 10)
                    .frame(width: 250)
                    .background(.brown)
                }
                .frame(width: 250, height: 150)
                .background(.ultraThinMaterial)
                .cornerRadius(15)
                .shadow(color:  .white, radius: 1, x: 1, y: 1)
                .shadow(color:  .white, radius: 1, x: -1, y: -1)
            
    }
    func promoActivate(){
        if code == "Jhd31-qn5Mw-yOjs1"
        {
            withAnimation{
                // add points
                if let email = viewModel.auth.currentUser?.email {
                    viewModel.points += 100
                    UserDefaults.standard.set(viewModel.points, forKey: "\(email.lowercased())")
                }
                isPromocode.toggle()
            }
        }
        else
        {
            withAnimation{
                isAlert.toggle()
            }
        }
    }
}
struct PromoCodeView_Previews: PreviewProvider {
    static var previews: some View {
        PromoCodeView(isPromocode: .constant(true))
            .environmentObject(userViewModel())
        
    }
}

import SwiftUI

struct HistoryView: View {
    @Binding var isHistory: Bool
    @EnvironmentObject var viewModel: userViewModel
    var body: some View {
        VStack{
            HStack{
                Text("History")
                    .font(.system(size: 25, weight: .bold))
                Spacer()
                Button{
                    withAnimation {
                        isHistory.toggle()
                    }
                }label: {
                    Image(systemName: "xmark")
                        .resizable()
                        .frame(width: 20, height: 20)
                }
            }
            .padding(.top, 100)
            .padding()
            Divider()
            Spacer()
            VStack{
               Text("History is empty")
                    .font(.system(size: 20, weight: .bold))
                    .rotationEffect(Angle(degrees: 45))
            }
            .padding(.horizontal, 40)
            Spacer()
        }
        .ignoresSafeArea()
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .background(.ultraThinMaterial)
        .padding(30)
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView(isHistory: .constant(true))
            .environmentObject(userViewModel())
    }
}

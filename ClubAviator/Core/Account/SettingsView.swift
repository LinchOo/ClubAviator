import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var viewModel: userViewModel
    @Binding var isSettings: Bool
    @State var isEditName: Bool = false
    @State var isConfirmDelete: Bool = false
    @State var newName: String = ""
    @State var isFeedback: Bool = false
    @State var feedbackText: String = ""
    
    var body: some View {
        VStack{
            HStack{
                Text("Settings")
                    .font(.system(size: 25, weight: .bold))
                Spacer()
                Button{
                    withAnimation {
                        isSettings.toggle()
                    }
                }label: {
                    Image(systemName: "xmark")
                        .resizable()
                        .frame(width: 20, height: 20)
                }
            }
            .padding()
            VStack{
                Divider()
                HStack{
                    Text("Name")
                    Spacer()
                    Button{
                        isEditName.toggle()
                    }label: {
                        Image(systemName: "highlighter")
                            .imageScale(.small)
                    }
                    Text(viewModel.userName)
                }
                HStack{
                    Text("Email")
                        .foregroundColor(.white.opacity(0.5))
                    Spacer()
                    
                    if viewModel.auth.currentUser != nil {
                        Text(viewModel.auth.currentUser!.email!)
                            .accentColor(.white.opacity(0.5))
                    } else {
                        Text("Empty")
                            .accentColor(.white.opacity(0.5))
                    }
                }
                Divider()
                Button{
                    isFeedback.toggle()
                }label: {
                    Text("Feedback")
                    Spacer()
                }
                Divider()
                Button{
                    viewModel.signOut()
                }label: {
                    Text("Logout")
                    Spacer()
                }
                Divider()
                Button{
                    isConfirmDelete.toggle()
                }label: {
                    Spacer()
                    Text("Delete account")
                        .foregroundColor(.red)
                }
            }
            .padding(.horizontal, 40)
        }
        .overlay(alignment: .center, content: {
            if isEditName {
                editNameSection
            }
            if isConfirmDelete{
                confirmDeleteSection
            }
            if isFeedback {
                feedbackSection
            }
        })
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .background(.ultraThinMaterial)
        .padding(30)
        .ignoresSafeArea()
    }
    private var feedbackSection: some View {
        VStack{
            VStack(spacing: 0){
                HStack{
                    Text("Write to us!")
                        .padding(.vertical, 10)
                        .foregroundColor(.white)
                }
                .frame(width: 250)
                .background(.brown)
                
                TextEditor(text: $feedbackText)
                    .frame(height: .infinity)
                HStack{
                    Spacer()
                    Button{
                        isFeedback.toggle()
                        feedbackText = ""
                    }label: {
                        Text("Send")
                            .foregroundColor(.white)
                    }
                    Spacer()
                    Divider()
                        .frame(height: 15)
                    Spacer()
                    Button{
                        isFeedback.toggle()
                        feedbackText = ""
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
            .frame(width: 250, height: 220)
            .background(.ultraThinMaterial)
            .cornerRadius(15)
            .shadow(color:  .white, radius: 1, x: 1, y: 1)
            .shadow(color:  .white, radius: 1, x: -1, y: -1)
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .background(.ultraThinMaterial)
    }
    private var confirmDeleteSection: some View {
        VStack{
            VStack{
                HStack{
                    Text("Warning!")
                        .padding(.vertical, 10)
                        .foregroundColor(.white)
                }
                .frame(width: 250)
                .background(.brown)
                VStack{
                    Text("Are you sure you want to delete your account?")
                }
                .frame(height: 100)
                HStack{
                    Spacer()
                    Button{
                        viewModel.deleteUser()
                        viewModel.signOut()
                        viewModel.userName = "Type name"
                        isConfirmDelete.toggle()
                    }label: {
                        Text("Yes")
                            .foregroundColor(.white)
                    }
                    Spacer()
                    Divider()
                        .frame(height: 15)
                    Spacer()
                    Button{
                        isConfirmDelete.toggle()
                    }label: {
                        Text("No, it's joke")
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
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .background(.ultraThinMaterial)

    }
    private var editNameSection: some View{
        VStack{
            VStack{
                HStack{
                    Text("Type New Name")
                        .padding(.vertical, 10)
                        .foregroundColor(.white)
                }
                .frame(width: 250)
                .background(.brown)
                TextField("\(viewModel.userName)", text: $newName)
                    .padding()
                HStack{
                    Spacer()
                    Button{
                        viewModel.userName = newName
                        if let email = viewModel.auth.currentUser?.email {
                            UserDefaults.standard.set(newName, forKey: "\(email.lowercased())name")
                           
                        }
                        newName = ""
                        isEditName.toggle()
                    }label: {
                        Text("Confirm")
                            .foregroundColor(.white)
                    }
                    Spacer()
                    Divider()
                        .frame(height: 15)
                    Spacer()
                    Button{
                        isEditName.toggle()
                        newName = ""
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
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .background(.ultraThinMaterial)

    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(isSettings: .constant(true))
            .environmentObject(userViewModel())
    }
}

//
//  PostApiView.swift
//  TestRequestOE
//
//  Created by Aleksandr on 04.05.2025.
//

import SwiftUI

struct PostApiView: View {
 
    @ObservedObject var postVM : PostApiViewModel
    var typeHandler: Block<(TabBarItem)>?
    @State var iswriteName: Bool = false
    @State var iswriteEmail: Bool = false
    @State var iswritePhone: Bool = false
    @State var userPhone: String = ""
    @State var isCompleted: Bool = false
    @State var isClickGalery: Bool = false
    @State var isClickCamera: Bool = false
    @State var isSelectedPosition: Bool = false
    @State private var isPickerPresented = false
    @State var resorce: UIImagePickerController.SourceType = .photoLibrary
    
    var body: some View {
       
        VStack {
            ZStack {
                T_Color.yellowColor.color
                Text(postVM.titleText)
            }
            .frame(height: 56)
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 40) {
                    
                    CustomTextFieldWithLable(messageText: postVM.messageName, namedField: postVM.name, isCorect: $postVM.isCorrectField, iswrite: $iswriteName, name: $postVM.username)
                    CustomTextFieldWithLable(messageText: postVM.messageEmail, namedField: postVM.email, isCorect: $postVM.isCorrectField, iswrite: $iswriteEmail, name: $postVM.userEmail)
                    CustomTextFieldWithLable(messageText: postVM.messagePhone, namedField: postVM.phone, isCorect: $postVM.isCorrectField, iswrite: $iswritePhone, name: $postVM.userPhone)
                     
                    Text("Select your position")
                        .font(.system(size: 18))
                        .foregroundStyle(T_Color.textColor.color)
                    VStack(alignment: .leading, spacing: 30) {
                        ForEach(postVM.positions, id: \.id) { position in
                            PositionView(position: position.name, isSelectedPosition: $postVM.isSelectedPositionStr)
                        }
                    }
                    UploadButtonViewWithLable(messageText: postVM.messagePhoto, isClick: $isPickerPresented, isCorect: $postVM.isCorrectField)
                    SignInButtonView(isCompleted: $postVM.isCompletedUser) { _ in
                        postVM.registrUser()
                    }

                    }
                    .padding()
                    .keyboardResponsive()
                
            }
        }
        .onTapGesture {
                    UIApplication.shared.endEditing()
                }
        .confirmationDialog("Choose how you want to add a photo", isPresented: $isPickerPresented) {
            Button() {
                resorce = .camera
                isClickGalery = true
            } label: {
                Text("Camera")
            }
            Button() {
                resorce = .photoLibrary
                isClickGalery = true
            } label: {
                Text("Gallery")
            }

        } message: {
            Text("Choose how you want to add a photo")
                .font(.system(size: 13, weight: .medium))
          }
        
        .sheet(isPresented: $isClickGalery) {
            ImagePicker(sourceType: resorce, selectedImage: $postVM.selectedImage) { _ in
                self.postVM.convertImage()
            }
        }
        .background(T_Color.white.color)
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
    }
}

//#Preview {
//    PostApiView()
//}

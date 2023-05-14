//
//  SignupView.swift
//  Xpensify
//
//  Created by Muhammad Suleman on 5/14/23.
//

import SwiftUI

struct SignupView: View {
    
    @State var name = ""//"Muhammad Suleman"
    @State var email = ""
    @State var passwod = ""
    
    var body: some View {
        HStack(spacing: 0) {
            //Signup Lotties Animations
            VStack { }
                .frame(width: 400, height: 500)
                .background(Color.red)
            
            Spacer()
            
            //Signup Form
            VStack(spacing: 12) {
                
                Text("Sign Up")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(.top)
                Text("Fill out this quick form to signup.")
                    .font(.title3)
                    .foregroundColor(.white)
                
                VStack(spacing: 20) {
                    TextField("", text: $name)
                        .placeholder(when: name.isEmpty) {
                            Text("Enter your fullnane")
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 14)
                        .background(Color.white)
                        .foregroundColor(.black)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    
                    TextField("", text: $email)
                        .placeholder(when: email.isEmpty) {
                            Text("Enter email address")
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 14)
                        .background(Color.white)
                        .foregroundColor(.black)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    
                    TextField("", text: $passwod)
                        .placeholder(when: passwod.isEmpty) {
                            Text("Create password")
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 14)
                        .background(Color.white)
                        .foregroundColor(.black)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                .padding(.top)
                
                Spacer()
                
                Button { } label: {
                    Text("Sign Up")
                        .padding()
                        .font(.largeTitle)
                        .frame(width: 360, height: 30)
                        .background(Color.blue)
                        .cornerRadius(14)
                }

                Spacer()
            }
            .padding()
            .frame(width: 400, height: 500)
            .background(Color.red)
        }
        .frame(minWidth: 800, maxWidth: 800,
               minHeight: 500 , maxHeight: 500)
        .background(Color.white)
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
            
            ZStack(alignment: alignment) {
                placeholder()
                    .opacity(shouldShow ? 0.5 : 0)
                self
            }
        }
}

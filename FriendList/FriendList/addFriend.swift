//
//  addFriend.swift
//  FriendList
//
//  Created by kenny on 2022/1/23.
//

import SwiftUI

@available(iOS 15.0, *)
struct addFriend: View {
    @State private var name = ""
    @State private var gender = ""
    @State private var gen = true
    @State private var birthday = Date()
    @State private var height = 140.0
    @State private var weight = 30.0
    @State private var meet = ""
    @State private var Age = 18
    @State private var state = "單身"
    @State private var Show = false
    @FocusState private var nameIsFocused: Bool
    @FocusState private var meetIsFocused: Bool
    var body: some View {
        VStack{
            Image("Friend")
                .resizable()
                .frame(width: 150, height: 150)
                .scaledToFit()
                .offset(x: -0, y: -20)
                
            Text("記錄你的朋友")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.orange)
                .offset(x: -0, y: -30)
            Text("與他的記憶")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(Color.orange)
                .offset(x: -0, y: -30)
            Form{
                Group{
                    Section{
                        TextField("名字", text: $name,prompt: Text("請輸入")).focused($nameIsFocused)
                    }
                    Section{
                        Toggle("性別：\(gen ? "男" : "女")", isOn: $gen)
                    }
                    Section{
                        Picker("感情狀態", selection: $state) {
                            Text("單身").tag("單身")
                            Text("穩交").tag("穩交")
                        }.pickerStyle(.segmented)
                    }
                    Section{
                        DatePicker("出生年月日", selection: $birthday,displayedComponents: .date)
                    }
                    Section{
                        Text("身高:\(height,specifier: "%.1F")")
                        Slider(value: $height,in: 140...200)
                    }
                    Section{
                        Text("體重:\(weight,specifier: "%.1F")")
                        Slider(value: $weight,in: 30...130)
                    }
                    Section{
                        Stepper(value: $Age, in: 10...100,step: 1) {
                            Text("年紀:\(Age)")
                        }
                    }
                    Section{
                        TextField("相遇", text: $meet,prompt: Text("我們的相遇")).focused($meetIsFocused)
                    }
                    Button {
                        Show = true
                        nameIsFocused = false
                        meetIsFocused = false
                    } label: {
                        Text("添加")
                    }.fullScreenCover(isPresented: $Show) {
                        FriendView(Show: $Show, name: $name,gender:$gender, birthday: $birthday, state: $state, height: $height, weight: $weight,meet:$meet)
                    }
                }
            }
        }
    }
}

struct addFriend_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 15.0, *) {
            addFriend()
        } else {
            // Fallback on earlier versions
        }
    }
}

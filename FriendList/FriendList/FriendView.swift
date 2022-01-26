//
//  FriendView.swift
//  FriendList
//
//  Created by kenny on 2022/1/23.
//

import SwiftUI

struct FriendView: View {
    @Binding var Show:Bool
    @Binding var name:String
    @Binding var gender:String
    @Binding var birthday:Date
    @Binding var state:String
    @Binding var height:Double
    @Binding var weight:Double
    @Binding var meet:String
    var body: some View {
        VStack{
            Text("你的朋友:\(name) \(gender)")
            Text("感情狀態:\(state)")
            Text("身高:\(height,specifier: "%.1F")   體重:\(weight,specifier: "%.1F")")
            Text("生日:\(birthday,style: .date)")
            Text("我們的相遇:\(meet)")
            Section{
                Button {
                    Show = false
                } label: {
                    Text("取消")
                }
            }
        }
    }
}


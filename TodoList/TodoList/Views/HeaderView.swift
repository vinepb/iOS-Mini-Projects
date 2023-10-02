//
//  HeaderView.swift
//  TodoList
//
//  Created by Vinicius Bernardo on 08/05/23.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subTitle: String
    let angle: Double
    let backgroundColor: Color

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(backgroundColor)
                .rotationEffect(Angle(degrees: angle))

            VStack {
                Text(title)
                    .font(.system(size: 50))
                    .foregroundColor(Color.primary)
                    .bold()
                Text(subTitle)
                    .font(.system(size: 30))
                    .foregroundColor(Color.primary)
            }
            .padding(.top, 80)
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 350)
        .offset(y: -150)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HeaderView(
                title: "Title", subTitle: "Subtitle", angle: 15.0, backgroundColor: .accentColor
            )
            .preferredColorScheme(.dark)
            Spacer()
        }
    }
}

//
//  SectionSpacerView.swift
//  TestCo
//
//  Created by Laddy Diaz Lamus on 23/10/20.
//

import SwiftUI

struct SectionSpacerView: View {

    let text: String

    var body: some View {
        HStack {
            Text(text.uppercased())
//                .font(name: FontConfig.default.robotoRegular,
//                      size: FontSizeConfig.default.text)
//                .foregroundColor(ColorConfig.shared.secondaryText)
            Spacer()
        }.padding(.vertical, 10)
        .padding(.horizontal, 25)
        .background(Color.gray)
    }
}

struct SectionSpacerView_Previews: PreviewProvider {
    static var previews: some View {
        SectionSpacerView(text: "TEXT_GENERAL".localized)
    }
}

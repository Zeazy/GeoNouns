//
//  ConnectButtonView.swift
//  GeoNouns
//
//  Created by Hamza Al Fadel on 16/03/2024.
//

import SwiftUI
import SwiftUI

struct ConnectButtonView: View {
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }) {
            HStack {
                Text("Connect")
                    .foregroundColor(.white)
                Image("metamask_logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 24, height: 24)
                    .padding(.leading, 8)
            }
            .padding(EdgeInsets(top: 10, leading: 16, bottom: 10, trailing: 16))
            .background(Color.black)
            .cornerRadius(8)
        }
    }
}

#Preview {
    ConnectButtonView(action: {})
}

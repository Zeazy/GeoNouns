//
//  NounInfoView.swift
//  GeoNouns
//
//  Created by Hamza Al Fadel on 16/03/2024.
//

import SwiftUI
struct NounInfoView: View {
//    let nounImage: Image
    let nounName: String
    var dismissAction: () -> Void
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Image(nounName)
            Text(formatNounName(from: nounName))
                .font(.largeTitle)
                .font(.custom("NounTown", size: 20))
                .bold()
            
        }
        
        VStack {
            Button(action: {
                await signMessage()
            }) {
                Text("Mint")
                    .font(.custom("NounTown", size: 20))
                    .bold()
                    .foregroundColor(.white)
                    .padding()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background(Capsule().fill(Color.black))
            }
            .padding(.horizontal)
            Spacer()
        }
        .padding(30)
    }
}

func formatNounName(from string: String) -> String {
    let components = string.split(separator: "_")
    guard let nounNumber = components.last, components.count == 2 else {
        return string // Return the original string if it doesn't match the expected format
    }
    return "Noun #\(nounNumber)"
}


#Preview {
    NounInfoView(nounName: "noun_1", dismissAction: {})
}

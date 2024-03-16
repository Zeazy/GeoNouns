//
//  SignView.swift
//  GeoNouns
//
//  Created by Hamza Al Fadel on 16/03/2024.
//

import SwiftUI
import metamask_ios_sdk


@MainActor
struct SignView: View {
    @EnvironmentObject var metamaskSDK: MetaMaskSDK
    @State var signMessage = ""
    @State private var showProgressView = false
    @State private var errorMessage = ""
    @State private var showError = false
    @State var result: String = ""
    
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
    
    func signMessage() async {
//        let account = metamaskSDK.account
//
//        showProgressView = true
//        let requestResult = await metamaskSDK.signTypedDataV4(typedData: signMessage, address: account)
//        showProgressView = false
//        
//        switch requestResult {
//        case let .success(value):
//            result = value
//            errorMessage = ""
//        case let .failure(error):
//            errorMessage = error.localizedDescription
//            showError = true
//        }
    }
}

#Preview {
    SignView()
}

//
//  WalletConnectView.swift
//  GeoNouns
//
//  Created by Hamza Al Fadel on 16/03/2024.
//

import SwiftUI

struct WalletConnectView: View {
    @ObservedObject private var connectionManager = WalletConnectionManager()
    @State var isConnectPresented = false
    @State var connectionError: String?
    
    var body: some View {
        NavigationStack {
            VStack {
                Button(action: {
                    Task {
                        let result = await connectionManager.connectToMetamask()
                        switch result {
                        case .success:
                            print("MetaMask connection succeeded")
                            isConnectPresented = true
                        case let .failure(error):
                            print("Error connecting to MetaMask: \(error.localizedDescription)")
                            connectionError = error.localizedDescription
                        }
                    }
                }) {
                    Image("metamask_logo")
                        .resizable()
                        .frame(width: 100, height: 100)
                }
                .padding()
                
                if let error = connectionError {
                    Text("Connection Error: \(error)")
                        .foregroundColor(.red)
                        .padding()
                }
            }
            .navigationDestination(isPresented: $isConnectPresented) {
                // TODO: Replace
                Text("Connected to MetaMask")
            }
        }
    }
}

#Preview {
    WalletConnectView()
}

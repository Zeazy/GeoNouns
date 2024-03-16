//
//  ConnectView.swift
//  GeoNouns
//
//  Created by Hamza Al Fadel on 16/03/2024.
//

import SwiftUI
import metamask_ios_sdk

extension Notification.Name {
    static let Event = Notification.Name("event")
    static let Connection = Notification.Name("connection")
}

@MainActor
struct ConnectView: View {
    // We recommend adding support for Infura API for read-only RPCs (direct calls) via SDKOptions
    @ObservedObject var metaMaskSDK = MetaMaskSDK.shared(
        appMetadata,
        sdkOptions: nil // SDKOptions(infuraAPIKey: "1234")
    )
    
    private static let appMetadata = AppMetadata(
        name: "GeoNouns",
        url: "https://geonouns.com",
        iconUrl: "https://cdn.sstatic.net/Sites/stackoverflow/Img/apple-touch-icon.png"
    )
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
    
}

#Preview {
    ConnectView()
}

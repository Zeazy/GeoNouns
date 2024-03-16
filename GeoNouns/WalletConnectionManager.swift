//
//  WalletConnectionManager.swift
//  GeoNouns
//
//  Created by Hamza Al Fadel on 16/03/2024.
//
import Foundation
import metamask_ios_sdk
import SwiftUI

enum SwapAIConnectionType {
    case metamask
    case walletconnect
}

class WalletConnectionManager: ObservableObject {
    let appMetadata = AppMetadata(name: "Geo Nouns", url: "https://geo.nouns")
    let sdkOptions = SDKOptions(infuraAPIKey: "1860cbbfda0047f3b99005540f8efacb")
    @ObservedObject var metamaskSDK: MetaMaskSDK
    
    var connectedAddress: String {
        return metamaskSDK.account
    }
    
    init() {
        metamaskSDK = MetaMaskSDK.shared(appMetadata, enableDebug: true, sdkOptions: sdkOptions)
        print("METASMASK.connected", metamaskSDK.connected)
    }
    
    func connectToMetamask() async -> Result<String, RequestError> {
        let result = await metamaskSDK.connect()
        return result
    }
    
    func disconnectFromMetamask() {
        metamaskSDK.disconnect()
    }
    
    func clearMetamaskSession() {
        metamaskSDK.clearSession()
    }
}

extension Notification.Name {
    static let MetamaskEvent = Notification.Name("event")
    static let MetamaskConnection = Notification.Name("connection")
}



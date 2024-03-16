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

//@MainActor
//struct ConnectView: View {
//    @ObservedObject var metaMaskSDK = MetaMaskSDK.shared(
//        appMetadata,
//        sdkOptions: nil // SDKOptions(infuraAPIKey: "1234")
//    )
//
//    private static let appMetadata = AppMetadata(
//        name: "Dub Dapp",
//        url: "https://dubdapp.com",
//        iconUrl: "https://cdn.sstatic.net/Sites/stackoverflow/Img/apple-touch-icon.png"
//    )
//
//    @State private var connected: Bool = false
//    @State private var status: String = "Offline"
//
//    @State private var errorMessage = ""
//    @State private var showError = false
//    
//    @State private var connectAndSignResult = ""
//    @State private var isConnectAndSign = false
//
//    @State private var showProgressView = false
//
//    var body: some View {
//        NavigationView {
//            List {
//                Section {
//                    Group {
//                        HStack {
//                            Text("Status")
//                                .bold()
//                                .modifier(TextCallout())
//                            Spacer()
//                            Text(status)
//                                .modifier(TextCaption())
//                        }
//
//                        HStack {
//                            Text("Chain ID")
//                                .bold()
//                                .modifier(TextCallout())
//                            Spacer()
//                            Text(metaMaskSDK.chainId)
//                                .modifier(TextCaption())
//                        }
//
//                        HStack {
//                            Text("Account")
//                                .bold()
//                                .modifier(TextCallout())
//                            Spacer()
//                            Text(metaMaskSDK.account)
//                                .modifier(TextCaption())
//                        }
//                    }
//                }
//
//                if metaMaskSDK.account.isEmpty {
//                    Section {
//                        Button {
//                            isConnectAndSign = true
//                        } label: {
//                            Text("Connect & Sign")
//                                .modifier(TextButton())
//                                .frame(maxWidth: .infinity, maxHeight: 32)
//                        }
//                        .sheet(isPresented: $isConnectAndSign, onDismiss: {
//                            isConnectAndSign = false
//                        }) {
//                            SignView(isConnectAndSign: true)
//                                .environmentObject(metaMaskSDK)
//                        }
//                        .modifier(ButtonStyle())
//                    } footer: {
//                        Text(connectAndSignResult)
//                            .modifier(TextCaption())
//                    }
//                }
//                
//                if !metaMaskSDK.account.isEmpty {
//                    Section {
//                        Button {
//                            metaMaskSDK.clearSession()
//                        } label: {
//                            Text("Clear Session")
//                                .modifier(TextButton())
//                                .frame(maxWidth: .infinity, maxHeight: 32)
//                        }
//                        .modifier(ButtonStyle())
//                        
//                        Button {
//                            metaMaskSDK.disconnect()
//                        } label: {
//                            Text("Disconnect")
//                                .modifier(TextButton())
//                                .frame(maxWidth: .infinity, maxHeight: 32)
//                        }
//                        .modifier(ButtonStyle())
//                    }
//                }
//            }
//            .font(.body)
//            .onReceive(NotificationCenter.default.publisher(for: .Connection)) { notification in
//                status = notification.userInfo?["value"] as? String ?? "Offline"
//            }
//            .navigationTitle("Dub Dapp")
//            .onAppear {
//                showProgressView = false
//            }
//        }
//    }
//}

struct TextCaption: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(.caption, design: .rounded))
            .foregroundColor(.black)
    }
}

struct TextCallout: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(.callout, design: .rounded))
            .foregroundColor(.black)
    }
}

struct TextButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(.body, design: .rounded))
            .foregroundColor(.white)
    }
}


//#Preview {
////    ConnectView()
//}

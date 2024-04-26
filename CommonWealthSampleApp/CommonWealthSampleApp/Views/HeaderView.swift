//
//  HeaderView.swift
//  CommonWealthSampleApp
//
//  Created by Ashika Shetty on 28/02/24.
//

import SwiftUI

struct HeaderView: View {
    @Environment(\.colorScheme) var colorScheme

    let account: Account
    
    var body: some View {
        VStack(alignment: .center) {
            HStack(alignment: .center, spacing: 30.0) {
    
                    Image("accountsimagetransactional")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                        .padding(.leading, 30)
                    
                VStack(alignment: .leading, spacing: 4.0) {
                        Text(account.accountName)
                            .font(.title3)
                            .fontWeight(.regular)
                            
                        Text(account.accountNumber)
                            .foregroundColor(.secondary)
                    }
                    .padding(.top, 10)
                    Spacer()
                }
                Spacer()
                ZStack {
                    if colorScheme == .light {
                        Constants.headerColor
                            .frame(maxWidth: .infinity)

                    } else {
                        Color.black
                            .frame(maxWidth: .infinity)

                    }

                    VStack(alignment: .leading, spacing: 8.0) {
                        HStack {
                            Spacer()
                            Text("Available funds")
                                .foregroundColor(.secondary)
                            Spacer()

                            let formattedFunds = String(format:  "%.2f", account.available)
                            Text(formattedFunds)
                                .padding(.horizontal, 20)

                            
                        }
                        HStack {
                            Spacer()

                            Text("Available Balance")
                                .foregroundColor(.secondary)
                            let accountsBalance = String(format: "%.2f", account.balance)
                            Spacer()

                            Text(accountsBalance)
                                .foregroundColor(.secondary)
                                .padding(.horizontal, 20)
                        }
                    }
                }
            }
        }
}

#Preview {
    HeaderView(account: Account.previewAccount())
}

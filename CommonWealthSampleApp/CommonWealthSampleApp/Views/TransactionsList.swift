//
//  ContentView.swift
//  CommonWealthSampleApp
//
//  Created by Ashika Shetty on 28/02/24.
//

import SwiftUI

struct TransactionsListView: View {
    @StateObject var transactionViewModel: TransactionsViewModel
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
            NavigationView {
            GeometryReader { geometry in

                List {
                    Section {
                        ZStack {
                            Constants.accountBGColor
                            if colorScheme == .light {
                                Color.white
                                    .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
                            } else {
                                Color.black.padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
                            }
                            
                            HeaderView(account: transactionViewModel.getAccountDetails())
                                .padding(.all, 20)
                        }
                        .frame(width: geometry.size.width)
                    }
                    ForEach(transactionViewModel.groupedTransactions, id: \.key) { transactionSection in
                        Section {
                            ForEach(transactionSection.value, id: \.id) { transaction in
                                if let atmID = transaction.atmId {
                                    TransactionView(transaction: transaction)
                                       
                                        .background {
                                            NavigationLink("", destination: {
                                                if let location  = transactionViewModel.getAtmLocation(atmID: atmID) {
                                                    MapView(location: location)
                                                } else {
                                                    Text("Sorry. ATM Location not found")
                                                }
                                            })
                                            .opacity(0.0)
                                        }
                                } else {
                                    TransactionView(transaction: transaction)
                                        
                                }
                            }
                        } header: {
                            ZStack {
                                Color.yellow
                                HStack {
                                    Text(transactionSection.key.formattedDate())
                                        .font(.subheadline)
                                        .foregroundColor(Color.black)
                                        .multilineTextAlignment(.leading)
                                        .padding(.horizontal)
                                        .bold()
                                    
                                    Spacer(minLength: 20)
                                    Text(transactionSection.key.numberOfDaysAgo())
                                        .font(.subheadline)
                                        .foregroundColor(Color.black)
                                        .multilineTextAlignment(.trailing)
                                        .padding(.horizontal)
                                        .bold()
                                }
                            }
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: -10))
                            .textCase(.none)
                        }
                        
                    }
                }
                .listSectionSpacing(0)
                .listRowSpacing(0)
                .padding(EdgeInsets(top: 0, leading: -20, bottom: 0, trailing: -20))
                .navigationTitle("Account Details")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

#Preview {
    TransactionsListView(transactionViewModel: TransactionsViewModel(sampleData: DataSample(account: Account.previewAccount(), transactions: Transactions.previewTransactions(), pending: nil, atms: nil)))
}



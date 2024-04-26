//
//  Account.swift
//  CommonWealthSampleApp
//
//  Created by Ashika Shetty on 28/02/24.
//

import Foundation


struct Account: Codable {
    let accountName: String
    let accountNumber: String
    let available: Double
    let balance: Double
}



struct DataSample: Codable {
    let account: Account
    let transactions: [Transactions]?
    let pending: [Transactions]?
    let atms: [ATM]?
}

#if DEBUG
extension Account {
    static func previewAccount() -> Account {
        let account = Account(accountName: "Ashika Shetty H", accountNumber: "062005 1709 5888", available: 1500, balance: 400)
        return account
    }
}
#endif

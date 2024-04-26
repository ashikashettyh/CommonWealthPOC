//
//  CommonWealthSampleAppApp.swift
//  CommonWealthSampleApp
//
//  Created by Ashika Shetty on 28/02/24.
//

import SwiftUI

@main
struct CommonWealthSampleAppApp: App {
    let sampleData = DataManager.fetchAccountDetails()
    var body: some Scene {
        WindowGroup {
            TransactionsListView(transactionViewModel: TransactionsViewModel(sampleData: sampleData))
        }
    }
}

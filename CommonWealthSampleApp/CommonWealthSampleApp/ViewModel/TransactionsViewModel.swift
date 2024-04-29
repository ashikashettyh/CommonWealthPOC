//
//  TransactionsViewModel.swift
//  CommonWealthSampleApp
//
//  Created by Ashika Shetty on 28/02/24.
//

import Foundation
class TransactionsViewModel: ObservableObject {
    var groupedTransactions = [(key: Date, value: [Array<Transactions>.Element])]()
    private var account: Account? = nil
    private var atms: [ATM]? = nil
    
    init(sampleData: DataSample?) {
        guard let sampleData = sampleData else {
            print("unable to fetch data from json")
            return
        }
        self.atms = sampleData.atms
        self.account = sampleData.account
        var pendingTransactions = [Transactions]()
        if let pending: [Transactions] = sampleData.pending {
            pendingTransactions = pending.map({ transaction in
                var pendingTransaction = transaction
                pendingTransaction.isPending = true
                return pendingTransaction
            })
        }
        let completedTransactions = sampleData.transactions ?? [Transactions]()
        
        sortTransactions(completedTransactions: completedTransactions, pendingTransactions: pendingTransactions)
    }
    
    // MARK: - sort the transactions based on dates and also group them for each day
    private func sortTransactions(completedTransactions: [Transactions], pendingTransactions: [Transactions]) {
        
        var allTransactions = pendingTransactions + completedTransactions
        allTransactions = allTransactions.sorted(by: {$0.date > $1.date})
        groupedTransactions = Dictionary(grouping: allTransactions) { transaction in
            transaction.date
        }.sorted(by: {$0.key > $1.key})
    }
    
    func getAccountDetails() -> Account {
        return self.account ?? Account(accountName: "Jane kane", accountNumber: "1234", available: 100.0, balance: 100.0)
    }
    
    func getAtmLocation(atmID: String) -> Location? {
        guard let atms = self.atms else {
            return nil
        }
        return atms.first(where: {$0.id == atmID})?.location
    }
}


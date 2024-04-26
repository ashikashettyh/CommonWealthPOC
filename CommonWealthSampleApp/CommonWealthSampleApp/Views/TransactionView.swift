//
//  TransactionView.swift
//  CommonWealthSampleApp
//
//  Created by Ashika Shetty on 28/02/24.
//

import SwiftUI

struct TransactionView: View {
    let transaction: Transactions
    var body: some View {
        HStack {
            if transaction.atmId != nil {
                Image("FindUsIcon")
                    .renderingMode(.template)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 40)
            }
            
            if transaction.isPending ?? false {
                Text("PENDING: ")
                    .bold() +
                Text(transaction.formattedDescription)
                
            } else {
                Text(transaction.formattedDescription)
                
            }
            Spacer(minLength: 10)
            Text(transaction.amount < 0 ? String(format:  "-$%.2f", abs(transaction.amount)) : String(format:  "$%.2f", abs(transaction.amount)))
                .multilineTextAlignment(.trailing)
        }
    }
}

#Preview {
    TransactionView(transaction: Transactions(id: "1506aeeb8c3a699b1e3c87db03156428", effectiveDate: "20/12/2015", description: "Wdl ATM CBA ATM", amount: -200.00, atmId: "129382"))
}

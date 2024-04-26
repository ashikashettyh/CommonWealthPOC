//
//  Transactions.swift
//  CommonWealthSampleApp
//
//  Created by Ashika Shetty on 28/02/24.
//

import Foundation


struct Transactions : Codable {
    let id : String
    let effectiveDate : String
    let description : String
    let amount : Double
    let atmId: String?
    var isPending: Bool? = false
    
    var date: Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let dateFromStrng = dateFormatter.date(from: effectiveDate)
        return dateFromStrng ?? Date()
    }
    
    var formattedDescription: String {
        description.replacingOccurrences(of: "<br/>", with: "\n")
    }
}

#if DEBUG
extension Transactions {
    static func previewTransactions() -> [Transactions] {
        let transaction1 = Transactions(id: "1", effectiveDate: "01-12-2022", description: "street 2 ", amount: -200.0, atmId: nil)
        let transaction2 = Transactions(id: "2", effectiveDate: "02-12-2022", description: "street 2 ", amount: -200.0, atmId: nil)
        return [transaction1, transaction2]
    }
}
#endif

//
//  TransactionsViewModel_tests.swift
//  CommonWealthSampleApp_Tests
//
//  Created by Ashika Shetty on 29/02/24.
//

import XCTest
@testable import CommonWealthSampleApp

final class TransactionsViewModel_tests: XCTestCase {
    var viewModel: TransactionsViewModel!
    var dataSample: DataSample!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        let account = Account(accountName: "Henry Cavill", accountNumber: "12345 6543 767", available: 200.0, balance: 40.0)
        let transaction1 = Transactions(id: "1", effectiveDate: "1-12-2023", description: "sydney road, AUS", amount: -50.0, atmId: nil)
        let transaction2 = Transactions(id: "2", effectiveDate: "1-12-2023", description: "sydney road, AUS", amount: -50.0, atmId: nil)
        let transaction3 = Transactions(id: "3", effectiveDate: "14-12-2023", description: "sydney road, AUS", amount: -50.0, atmId: "1234")
        let pendingTransaction = Transactions(id: "4", effectiveDate: "14-12-2023", description: "sydney road, AUS", amount: -50.0, atmId: nil)
        let atm = ATM(id: "1234", name: "CAB atm", address: "sydney beach", location: Location(lat: -20.0, lng: 151.0))
        dataSample = DataSample(account: account, transactions: [transaction1, transaction2, transaction3], pending: [pendingTransaction], atms: [atm])
        viewModel = TransactionsViewModel(sampleData: dataSample)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewModel = nil
        dataSample = nil
        try super.tearDownWithError()
    }
    
    func test_TransactionsViewModel_groupedTransactions_count() throws {
        // since we have two dates
        XCTAssertEqual(viewModel.groupedTransactions.count, 2)
    }
    
    func test_TransactionsViewModel_groupedTransactions_dateValues() throws {
        // match the sorted dates
        let date1 = viewModel.groupedTransactions[0].key
        let date2 = viewModel.groupedTransactions[1].key
        XCTAssertEqual(date1.formattedDate(), "14 Dec 2023")
        XCTAssertEqual(date2.formattedDate(), "01 Dec 2023")
    }
    
    func test_TransactionsViewModel_groupedTransactions_transactionValues() throws {
        // since we have two dates, with two transactions each
        let transactionsOnDay1 = viewModel.groupedTransactions[0].value.count
        let transactionsOnDay2 = viewModel.groupedTransactions[1].value.count
        XCTAssertEqual(transactionsOnDay1, 2)
        XCTAssertEqual(transactionsOnDay2, 2)
    }
    
    // Requirement from Bonus point -  Show pending transaction with same dates should be placed first
    func test_TransactionsViewModel_groupedTransactions_pendingFirst() throws {
        let transactiosnOnDay2 = viewModel.groupedTransactions[0].value
        let idOfthefirsttransactinOnDay2 = transactiosnOnDay2[0].id
        XCTAssertEqual(idOfthefirsttransactinOnDay2, "4")
    }
    
    func test_TransactionsViewModel_getaccountDetails_matchAllValues() throws {
        let account = viewModel.getAccountDetails()
        XCTAssertEqual(account.accountName, "Henry Cavill")
        XCTAssertEqual(account.accountNumber, "12345 6543 767")
        XCTAssertEqual(account.available, 200.0)
        XCTAssertEqual(account.balance, 40.0)
    }
    
    func test_TransactionsViewModel_getATMLocation_matchAllValues() throws {
        let location = viewModel.getAtmLocation(atmID: "1234")
        XCTAssertEqual(location?.lat, -20.0)
        XCTAssertEqual(location?.lng, 151.0)
    }
    
    func test_TransactionsViewModel_getATMLocation_getNil() throws {
        XCTAssertNil(viewModel.getAtmLocation(atmID: "1233"))
    }
}

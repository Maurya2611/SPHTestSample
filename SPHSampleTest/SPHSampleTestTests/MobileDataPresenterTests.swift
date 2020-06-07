//
//  MobileDataPresenterTests.swift
//  SPHSampleTestTests
//
//  Created by Chandresh on 7/6/20.
//  Copyright © 2020 Chandresh. All rights reserved.
//

import XCTest
@testable import SPHSampleTest

class MobileDataPresenterTests: XCTestCase {
    var subject: MobileDataPresenter!
    var posts: [MobileDataViewModel] = []
    
    // MARK: Test lifecycle
    override func setUp() {
        super.setUp()
        setupPostDetailsPresenter()
    }
    override func tearDown() {
        subject = nil
        super.tearDown()
    }
    
    // MARK: Test setup
    func setupPostDetailsPresenter() {
        subject = MobileDataPresenter()
    }
    
    // MARK: Tests
    func testPresentPosts() {
        // Given
        let mock = MobileDataDisplayLogicMockData()
        subject.viewController = mock
        let data =  MobileDataViewModel(volume: "23.2333" , quarter: "2016" , id:  0, volumeDataDecrease: true)
        posts.append(data)
        // When
        subject.presentMobileData(response: posts)
        // Then
        XCTAssertTrue(mock.displayPostCalled, "PresentPosts() should ask the view controller to display the result")
    }
}
// MARK: Test doubles
class MobileDataDisplayLogicMockData: MobileDataProtocol {
    var displayPostCalled = false
    func displayMobileData(viewModel: [MobileDataViewModel]) {
        displayPostCalled = true
    }
}

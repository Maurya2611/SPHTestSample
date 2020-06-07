//
//  MobileDataViewControllerTests.swift
//  SPHSampleTestTests
//
//  Created by Chandresh on 7/6/20.
//  Copyright © 2020 Chandresh. All rights reserved.
//

import XCTest
@testable import SPHSampleTest

class MobileDataViewControllerTests: XCTestCase {
    var viewControl: MobileDataViewController!
    var window: UIWindow!
    var posts: [MobileDataViewModel] = []
    // var cell: MobileDataTableViewCell?
    
    // MARK: Test lifecycle
    override func setUp() {
        super.setUp()
        window = UIWindow()
        setupMobileDataViewController()
        // cell = MobileDataTableViewCell()
    }
    
    override func tearDown() {
        window = nil
        viewControl = nil
        posts = []
        super.tearDown()
    }
    
    // MARK: Test setup
    func setupMobileDataViewController() {
        viewControl = MobileDataViewController()
    }
    
    func loadView() {
        window.addSubview(viewControl.view)
        RunLoop.current.run(until: Date())
    }
    
    func testfetchMobileData() {
        // Given
        let logicMockData = MobileDataBusinessLogicMockData()
        viewControl.interactor = logicMockData
        viewControl.fetchMobileData()
        // When
        loadView()
        // Then
        XCTAssertTrue(logicMockData.fetchPostCalled, "viewDidLoad() should ask the interactor to do fetch posts")
    }
    
    func testDisplayMobileData() {
        //Given
        let data =  MobileDataViewModel(volume: "23.2333" , quarter: "2016" , id:  0, volumeDataDecrease: true)
        posts.append(data)
        //when
        loadView()
        viewControl.displayMobileData(viewModel: posts )
        // Then
        XCTAssertEqual(posts.count, 1)
    }
    // MARK: Referesh Data
    func testRefreshMobileData() {
        viewControl.refreshData()
        XCTAssertTrue(viewControl.postData == nil, "Array isEmpty")
    }
    func testShowPupUp() {
        let delegate = MockshowPopUpDelegateData()
        let cell = viewControl.tableView(viewControl.tableView, cellForRowAt: IndexPath(item: 0, section: 0)) as? MobileDataTableViewCell
        cell?.delegate = delegate
        cell?.increaseDecreaseVolume.sendActions(for: .touchUpInside)
        viewControl.showPopUpWithMessage()
        XCTAssertTrue(delegate.isShow == true, "popUp is Shown")
    }
}
// MARK: Test doubles
class MobileDataBusinessLogicMockData: MobileDataDetailsBusinessLogic {
    var fetchPostCalled = false
    func fetchMobileData(request: MobileDataModel.Data.Request) {
        fetchPostCalled = true
    }
}
class MockshowPopUpDelegateData: MobileDataTableViewCellDelegate {
    var isShow = false
    func showPopUpWithMessage() {
        isShow = true
    }
}

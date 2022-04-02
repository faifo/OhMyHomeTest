//
//  SearchPresenterTests.swift
//  OhMyHomeTests
//
//  Created by Solo on 02/04/2022.
//

import XCTest
@testable import OhMyHome

class SearchPresenterTest : XCTestCase {
    let searchUseCaseStub = SearchUseCaseStub()
    let searchRouterSpy = SearchRouterSpy()
    let searchViewSpy = SearchViewSpy()
    
    var searchPresenter : SearchPresenterImpl!
    
    // MARK: - set up
    override func setUp() {
        super.setUp()
        searchPresenter = SearchPresenterImpl(view: searchViewSpy, useCase: searchUseCaseStub, router: searchRouterSpy)
        searchPresenter.term = "Test"
        searchPresenter.hasMore = true
    }
    
    // MARK: - tests
    func test_searchSuccess_RefreshTableView() {
        //given
        let mediaTobeReturned = ItunesMedia.createArray()
        searchUseCaseStub.searchMediaToBeReturned = .success(mediaTobeReturned)
        
        searchPresenter.search()
        //then
        XCTAssertTrue(searchViewSpy.refreshTableViewCalled, "refreshTableView was not called")
        XCTAssertTrue(searchViewSpy.finishLoadingSuccessed, "ViewControllerState not received")
    }
    
}

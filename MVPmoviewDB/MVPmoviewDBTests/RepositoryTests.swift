//
//  MVPmoviewDBTests.swift
//  MVPmoviewDBTests
//
//  Created by Nathan Baptista Schostack on 25/03/24.
//

import XCTest
@testable
import MVPmoviewDB

final class RepositoryTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        
    }
    
    func testFetchNowPlaying() throws {
        var sut: APIMovieRepository!
        try super.setUpWithError()
        sut = APIMovieRepository()
        
        sut.fetchMovies(endpoint: .nowPlaying) { isFinished in
            XCTAssertTrue(isFinished)
        }
    }
    
    func testFetchPopular() throws {
        var sut: APIMovieRepository!
        try super.setUpWithError()
        sut = APIMovieRepository()
        
        sut.fetchMovies(endpoint: .popular) { isFinished in
            XCTAssertTrue(isFinished)
        }
    }
    
    func testGetNumberOfSections() throws {
        var sut: APIMovieRepository!
        try super.setUpWithError()
        sut = APIMovieRepository()
        
        let endPointCount = Endpoint.allCases.count
        XCTAssertEqual(endPointCount, sut.getNumberOfSections())
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}

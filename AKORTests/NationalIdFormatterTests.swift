//
//  NationalIdFormatterTests.swift
//  AKORTests
//
//  Created by Hakan Or on 13.02.2023.
//

import XCTest
@testable import AKOR

final class NationalIdFormatterTests: XCTestCase {
    private var sut: NationalIdFormatter!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = NationalIdFormatter()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func test_national_id_formatter_should_inform_success_when_national_id_is_11_char() {
        // Given
        let nationalId = "12345678912"
        
        // When
        sut.format(text: nationalId)
        
        // Then
        XCTAssertEqual(sut.format(text: nationalId),"12345678912")
    }
    
    func test_national_id_formatter_should_inform_success_when_national_id_is_under_11_char() {
        // Given
        let nationalId = "123456789123"
        
        // When
        sut.format(text: nationalId)
        
        // Then
        XCTAssertEqual(sut.format(text: nationalId),"12345678912")
    }
    
    func test_national_id_formatter_should_inform_success_when_national_id_has_only_numeric_chars() {
        // Given
        let nationalId = "12345a7891_"
        
        // When
        sut.format(text: nationalId)
        
        // Then
        XCTAssertEqual(sut.format(text: nationalId),"123457891")
    }
    
}

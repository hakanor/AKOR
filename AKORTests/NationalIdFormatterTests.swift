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
    
    func test_national_id_formatter_should_not_remove_chars_when_national_id_is_11_char() {
        // Given
        let validNationalId = "12345678912"
        
        // When
        let output = sut.format(text: validNationalId)
        
        // Then
        XCTAssertEqual(output, validNationalId)
    }
    
    func test_national_id_formatter_should_remove_overflowed_chars_when_national_id_is_above_11_char() {
        // Given
        let overflowNationalId = "123456789123"
        let expectedNationalId = "12345678912"
        
        // When
        let output = sut.format(text: overflowNationalId)
        
        // Then
        XCTAssertEqual(output, expectedNationalId)
    }
    
    func test_national_id_formatter_should_remove_non_numeric_chars_when_national_id_has_not_only_numeric_chars() {
        // Given
        let alphaNumericNationalId = "12345a7891_"
        let expectedNationalId = "123457891"
        
        // When
        let output = sut.format(text: alphaNumericNationalId)
        
        // Then
        XCTAssertEqual(output, expectedNationalId)
    }
    
}

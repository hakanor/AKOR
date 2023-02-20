//
//  DeclarationServiceTests.swift
//  AKORTests
//
//  Created by Hakan Or on 12.02.2023.
//

import XCTest
@testable import AKOR

final class DeclarationServiceTests: XCTestCase {
    private var sut: DeclarationService!
    private var delegate: MockDeclarationServiceDelegate!

    override func setUpWithError() throws {
        try super.setUpWithError()
        //sut = DeclarationService()
        delegate = MockDeclarationServiceDelegate()
        sut.delegate = delegate
    }

    override func tearDownWithError() throws {
        sut = nil
        delegate = nil
        try super.tearDownWithError()
    }
    
    func test_declaration_service_should_inform_success_when_national_id_is_11_char() {
        // Given
        let nationalId = "12345678912"
        
        // When
        sut.createDeclaration(nationalId: nationalId)
        
        // Then
        XCTAssertTrue(delegate.declarationCreatedCalled)
    }
    
    func test_declaration_service_should_inform_failed_when_national_id_is_under_11_char() {
        // Given
        let nationalId = "1234567891"
        
        // When
        sut.createDeclaration(nationalId: nationalId)
        
        // Then
        XCTAssertTrue(delegate.declarationFailedCalled)
    }
    
    func test_declaration_service_should_inform_failed_when_national_id_is_below_11_char() {
        // Given
        let nationalId = "123456789123"
        
        // When
        sut.createDeclaration(nationalId: nationalId)
        
        // Then
        XCTAssertTrue(delegate.declarationFailedCalled)
    }
    
    
}

final class MockDeclarationServiceDelegate: DeclarationServiceDelegate {
    var declarationCreatedCalled = false
    var declarationFailedCalled = false

    func declarationCreated() {
        declarationCreatedCalled = true
    }
    
    func declarationFailed() {
        declarationFailedCalled = true
    }
}

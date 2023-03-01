//
//  DeclarationViewModelTests.swift
//  AKORTests
//
//  Created by Hakan Or on 1.03.2023.
//

import XCTest
@testable import AKOR

final class DeclarationViewModelTests: XCTestCase {
    private var sut: DeclarationViewModel!
    private var delegate: MockDeclarationViewModelDelegate!
    private var declarationService: MockDeclarationService!

    override func setUpWithError() throws {
        try super.setUpWithError()
        declarationService = MockDeclarationService()
        sut = DeclarationViewModel(declarationService: declarationService)
        delegate = MockDeclarationViewModelDelegate()
        sut.delegate = delegate
    }

    override func tearDownWithError() throws {
        sut = nil
        delegate = nil
        declarationService = nil
        try super.tearDownWithError()
    }
    
    func test_create_declaration_should_be_called_when_national_id_is_not_nil() {
        // Given
        let nationalId = "12345678910"
        
        // When
        sut.createButtonDidTap(nationalId: nationalId)
        
        // Then
        XCTAssertTrue(delegate.dataFetchDidStartCalled)
        XCTAssertTrue(declarationService.createDeclarationCalled)
        XCTAssertEqual(nationalId, declarationService.passedNationalId)
    }

}

final class MockDeclarationService: DeclarationServiceProtocol {
    var createDeclarationCalled = false
    var passedNationalId: String?
    
    func createDeclaration(nationalId: String?) {
        createDeclarationCalled = true
        passedNationalId = nationalId
    }
    
    var delegate: AKOR.DeclarationServiceDelegate?
    
}

final class MockDeclarationViewModelDelegate: DeclarationViewModelDelegate {
    var dataFetchDidStartCalled = false

    func dataFetchDidStart() {
        dataFetchDidStartCalled = true
    }

}

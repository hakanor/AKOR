//
//  DeclarationViewModel.swift
//  AKOR
//
//  Created by Hakan Or on 28.02.2023.
//

protocol DeclarationViewModelDelegate: AnyObject {
    func dataFetchDidStart()
    func errorMessageDidDisplay()
}

final class DeclarationViewModel {
    
    private var declarationService : DeclarationServiceProtocol
    weak var delegate: DeclarationViewModelDelegate?
    
    init(declarationService: DeclarationServiceProtocol = DeclarationService()) {
        self.declarationService = declarationService
        self.declarationService.delegate = self
    }
    
    func createButtonDidTap(nationalId: String?) {
        guard nationalId != "" else {
            // TODO: Show error message
            delegate?.errorMessageDidDisplay()
            return
        }
        delegate?.dataFetchDidStart()
        declarationService.createDeclaration(nationalId: nationalId)
    }
}

extension DeclarationViewModel: DeclarationServiceDelegate {
    func declarationCreated() {
        
    }
    
    func declarationFailed() {
        
    }
}

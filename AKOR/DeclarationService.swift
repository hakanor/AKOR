//
//  DeclarationService.swift
//  AKOR
//
//  Created by Hakan Or on 12.02.2023.
//

protocol DeclarationServiceDelegate: AnyObject {
    func declarationCreated()
    func declarationFailed()
}

final class DeclarationService {
    weak var delegate: DeclarationServiceDelegate?
    
    func createDeclaration(nationalId: String?) {
        if nationalId?.count == 11 {
            delegate?.declarationCreated()
        } else {
            delegate?.declarationFailed()
        }
    }
}

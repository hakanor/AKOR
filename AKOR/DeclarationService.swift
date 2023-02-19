//
//  DeclarationService.swift
//  AKOR
//
//  Created by Hakan Or on 12.02.2023.
//

import Alamofire

protocol DeclarationServiceDelegate: AnyObject {
    func declarationCreated()
    func declarationFailed()
}

final class DeclarationService {
    weak var delegate: DeclarationServiceDelegate?
    private let networkProvider: NetworkProvidable
    
    init(networkProvider: NetworkProvidable) {
        self.networkProvider = networkProvider
    }
    
    func createDeclaration(nationalId: String?) {
        if nationalId?.count == 11 {
            networkProvider.request(url: "https://google.com.tr") { [weak self] in
                self?.delegate?.declarationCreated()
            } failure: { [weak self] in
                self?.delegate?.declarationFailed()
            }

        } else {
            delegate?.declarationFailed()
        }
    }
}

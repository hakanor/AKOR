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

protocol DeclarationServiceProtocol {
    func createDeclaration(nationalId: String?)
    var delegate: DeclarationServiceDelegate? { get set }
}

final class DeclarationService: DeclarationServiceProtocol {
    weak var delegate: DeclarationServiceDelegate?
    private let networkProvider: NetworkProvidable
    
    init(networkProvider: NetworkProvidable = NetworkProvider()) {
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

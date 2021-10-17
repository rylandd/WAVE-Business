//
//  RegistrationViewModel.swift
//  WAVE Business
//
//  Created by Tomas Sungaila on 10/17/21.
//

import Foundation
import Combine

enum RegistrationState {
    case successful
    case failed(error: Error)
    case na
}

protocol RegistrationViewModel {
    func register()
    var service: RegistrationService {get}
    var state: RegistrationState {get}
    var userDetails: RegistrationDetails {get}
    init(service: RegistrationService)
}

final class RegistrationViewModelImpl: ObservableObject, RegistrationViewModel {
    
    let service: RegistrationService
    var state: RegistrationState = .na
    var userDetails: RegistrationDetails = RegistrationDetails.new
    
    private var subscriptions = Set<AnyCancellable>()
    
    init(service: RegistrationService) {
        self.service = service
        
    }
    
    func register() {
        
        service
            .register(with: userDetails)
            .sink { [weak self] res in
                switch res {
                case .failure(let error):
                    self?.state = .failed(error: error)
                default: break
                }
            } receiveValue: { [weak self] in
                self?.state = .successful
            }
            .store(in: &subscriptions)
    }
}

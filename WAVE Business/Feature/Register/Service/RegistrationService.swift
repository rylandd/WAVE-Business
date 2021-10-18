//
//  RegistrationService.swift
//  WAVE Business
//
//  Created by Tomas Sungaila on 10/17/21.
//

import Foundation
import Combine
import FirebaseDatabase
import Firebase


enum RegistrationKeys: String {
    case firstName
    case lastName
    case barName
}

protocol RegistrationService {
    func register(with details: RegistrationDetails) -> AnyPublisher<Void, Error>
    
}

final class RegistrationServiceImpl: RegistrationService {
    
    func register(with details: RegistrationDetails) -> AnyPublisher<Void, Error> {
        
        Deferred {
            
            Future { promise in
                
                Auth.auth()
                    .createUser(withEmail: details.email, password: details.password){ res, error in
                        
                        if let err = error {
                            promise(.failure(err))
                        } else {
                            
                            if let uid = res?.user.uid {
                                
                                let values = [RegistrationKeys.firstName.rawValue: details.firstName,
                                              RegistrationKeys.lastName.rawValue: details.lastName,
                                              RegistrationKeys.barName.rawValue: details.barName] as [String: Any]
                                
                                Database.database()
                                    .reference()
                                    .child("users")
                                    .child(uid)
                                    .updateChildValues(values) { error, ref in
                                        
                                        if let err = error{
                                            promise(.failure(err))
                                        } else {
                                            promise(.success(()))
                                        }
                                    }
                            } else {
                                
                                promise(.failure(NSError(domain: "Invalid User Id", code: 0, userInfo: nil)))
                            }
                        }
                    }
                
            }
        }
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher()
    }
}




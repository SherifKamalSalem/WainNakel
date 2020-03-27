//
//  DomainAssembly.swift
//  WainNakel
//
//  Created by Xpress Integration on 3/27/20.
//  Copyright © 2020 Aqwas. All rights reserved.
//

import Foundation
import Swinject
import SwinjectStoryboard

class DomainAssembly: Assembly {
    func assemble(container: Container) {
        container.register(LoginUseCase.self) { r in
            return LoginUseCase(repository: r.resolve(AuthentificationRepository.self)!)
        }
    }
}

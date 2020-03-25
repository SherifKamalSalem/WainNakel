//
//  UseCase.swift
//  WainNakel
//
//  Created by Sherif Kamal on 3/25/20.
//  Copyright © 2020 Aqwas. All rights reserved.
//

import Foundation

public protocol UseCase {
    @discardableResult
    func start() -> Cancellable?
}

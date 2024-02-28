//
//  DIContainer.swift
//  TestCleanArchitecture
//
//  Created by Mohamed Aboushady on 05/02/2024.
//

import Foundation

final class DIContainer: DIContainerProtocol{
    static let shared = DIContainer()

    private init() {}

    var services: [String: Any] = [:]

    func register<Service>(type: Service.Type, component: Any) {
        services["\(type)"] = component
    }

    func resolve<Service>(type: Service.Type) -> Service? {
      return services["\(type)"] as? Service
    }
}

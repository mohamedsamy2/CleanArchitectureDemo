//
//  DIContainerProtocol.swift
//  TestCleanArchitecture
//
//  Created by Mohamed Aboushady on 05/02/2024.
//

import Foundation

protocol DIContainerProtocol{
      func register<Service>(type: Service.Type, component: Any)
      func resolve<Service>(type: Service.Type) -> Service?
}

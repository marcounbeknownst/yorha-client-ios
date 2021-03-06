//
//  AutomataRouter.swift
//  yorha-client-ios
//
//  Created by Marco Vazquez on 4/30/19.
//  Copyright © 2019 Marco Vazquez. All rights reserved.
//

import UIKit

class AutomataRouter: AutomataRouterProtocol {

    weak var viewController: UIViewController?

    static func createModule() -> UIViewController {
        let mainView = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "AutomataNavController")
        if let view = mainView.children.first as? AutomataViewController {
            let interactor = AutomataInteractor()
            let router = AutomataRouter()
            let presenter = AutomataPresenter(interface: view, interactor: interactor, router: router)
            let localData = AutomataStore()
            let remoteData = AutomataSession()
            
            view.presenter = presenter
            presenter.view = view
            presenter.interactor = interactor
            presenter.router = router
            interactor.presenter = presenter
            interactor.remoteData = remoteData
            interactor.localData = localData
            remoteData.interactor = interactor
            remoteData.presenter = presenter
            router.viewController = view
            
            return mainView
        }

        return UIViewController()
    }
    
    func showDetailScreen(view: AutomataViewProtocol, data: Automata) {
        let detailViewController = AutomataDetailRouter.createModule(data: data)
        
        if let sourceView = view as? UIViewController {
            sourceView.navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
}

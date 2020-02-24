//
//  DetailViewController.swift
//  RxTestProject
//
//  Created by Olusegun Solaja on 2020-02-24.
//  Copyright © 2020 Olusegun Solaja. All rights reserved.
//

import UIKit
import RxSwift

class DetailViewController: UIViewController {

    lazy var presentNewController:UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Present New Controller", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return  button
    }()
    
    
    private var viewModel: DetailViewModel!
    private let disposeBag = DisposeBag()

    init(_ viewModel: DetailViewModel) {
       self.viewModel = viewModel
       super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView(){
        view.backgroundColor = .orange
        
        view.addSubview(presentNewController)
        
        NSLayoutConstraint.activate([
            presentNewController.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            presentNewController.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            presentNewController.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        presentNewController.rx.tap
            .bind(to: viewModel.presentNewController)
            .disposed(by: disposeBag)
    }

}

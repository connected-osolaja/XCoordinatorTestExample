//
//  FirstPageViewController.swift
//  RxTestProject
//
//  Created by Olusegun Solaja on 2020-02-21.
//  Copyright © 2020 Olusegun Solaja. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class TodayForecastViewController: UIViewController {
    
    lazy var presentAlertButton:UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Present Alert", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return  button
    }()
    
    lazy var showDetailViewButton:UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Show Detail", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return  button
    }()
    
    private var viewModel: TodayForecastViewModel!
    private let disposeBag = DisposeBag()
    
    init(_ viewModel: TodayForecastViewModel) {
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
        view.backgroundColor = .white
        
        view.addSubview(presentAlertButton)
        view.addSubview(showDetailViewButton)
        
        NSLayoutConstraint.activate([
            presentAlertButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            presentAlertButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            presentAlertButton.heightAnchor.constraint(equalToConstant: 45),
            
            showDetailViewButton.topAnchor.constraint(equalTo: presentAlertButton.bottomAnchor , constant: 10),
            showDetailViewButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            showDetailViewButton.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        presentAlertButton.rx.tap
            .bind(to: viewModel.presentTrigger)
            .disposed(by: disposeBag)
        
        showDetailViewButton.rx.tap
            .bind(to: viewModel.showDetailView)
            .disposed(by: disposeBag)
    }
    
}

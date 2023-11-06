//
//  DiscoverViewController.swift
//  OnlineFitnessTrainerApp
//
//  Created by Admin on 11/5/23.
//

import UIKit

final class DiscoverViewController: UIViewController, LevelViewDelegate {
    func levelButtonWasTapped(_ button: UIButton) {
        print("pressd")
    }

    private lazy var workoutTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.register(DiscoverTableViewCell.self, forCellReuseIdentifier: DiscoverTableViewCell.identifier)
        view.addSubview(tableView)
        return tableView
    }()
    
    private let levelButtonsView = LevelView()
    private lazy var heightForRow: CGFloat = self.workoutTableView.frame.height / 4
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = false
        configurationOfUI()
    }
    
    private func configurationOfUI() {
        workoutTableView.delegate = self
        workoutTableView.dataSource = self
        levelButtonsView.delegate = self
        view.addSubview(levelButtonsView)
        addConstraints()
        view.backgroundColor = Const.Colors.backgroundColorDark
        let image = Const.Icon.goFitIcon
        
        let customBtn = UIButton()
        customBtn.updateButton(with: image, and: "Discover")
        customBtn.titleLabel?.font = UIFont(name: Const.FontFemily.Helvetica.normal, size: 16)
        let btn = UIBarButtonItem(customView: customBtn)
        
        //  Set left bar button
        self.navigationItem.setLeftBarButton(btn, animated: true)
    }
}

extension DiscoverViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DiscoverTableViewCell.identifier, for: indexPath) as? DiscoverTableViewCell else { return UITableViewCell() }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { heightForRow }
}

extension DiscoverViewController {
    
    private func addConstraints() {
        workoutTableView.translatesAutoresizingMaskIntoConstraints = false
        levelButtonsView.translatesAutoresizingMaskIntoConstraints = false

        //  add level buttons view constraints
        levelButtonsView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        levelButtonsView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        levelButtonsView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        levelButtonsView.bottomAnchor.constraint(equalTo: workoutTableView.topAnchor, constant: -10).isActive = true
        
        //  Add workoutTableView constraints
        workoutTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        workoutTableView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        workoutTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}

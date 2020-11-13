//
//  DetailsCharacterViewController.swift
//  MarvelHeroes
//
//  Created by Ekaterina Khudzhamkulova on 3.11.2020.
//  Copyright © 2020 Ekaterina. All rights reserved.
//

import Foundation
import UIKit

protocol IDetailsCharacterViewController: AnyObject
{
}

class DetailsCharacterViewController: UIViewController {

	private let presenter: DetailCharacterPresenter

	private let backgroundColor = UIColor(named: "headerColor")

	private var textLabel: UILabel = {
		let label = UILabel()
		label.textAlignment = .left
		label.font = .systemFont(ofSize: 20)
		label.numberOfLines = 0
		label.backgroundColor = .clear
		label.textColor = UIColor(named: "headerTitleColor")
		return label
	}()
	
	private var titleLabel: UILabel = {
		let label = UILabel()
		label.textAlignment = .left
		label.font = .boldSystemFont(ofSize: 32)
		label.numberOfLines = 0
		label.backgroundColor = .clear
		label.textColor = UIColor(named: "headerTitleColor")
		return label
	}()


	private var image: UIImageView = {
		let backImageView = UIImageView(image: UIImage(named: "UIImage_1"))
		return backImageView
	}()

	init(presenter: DetailCharacterPresenter) {
		self.presenter = presenter
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		self.view.backgroundColor = backgroundColor
		loadData()
		setupImage()
		setGradient()
		setupTitleLabel()
		setupLabel()
		self.navigationController?.navigationBar.isTranslucent = true
		self.navigationController?.view.backgroundColor = .clear
	}


	func loadData() {
		textLabel.text = presenter.loadCharacterData().0.description
		titleLabel.text = presenter.loadCharacterData().0.name
		image.image = presenter.loadCharacterData().1
	}

	func setupImage() {
		view.addSubview(image)
		image.translatesAutoresizingMaskIntoConstraints = false

		image.topAnchor.constraint(equalTo: view.topAnchor).isActive = true

		image.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
		image.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
		image.heightAnchor.constraint(equalToConstant: image.frame.width).isActive = true
		image.contentMode = .scaleAspectFill
		view.layoutSubviews()

	}
	func setGradient() {
		let view = UIView(frame: image.frame)
		let gradient = CAGradientLayer()

		gradient.frame = view.frame
		let startingColor = backgroundColor?.cgColor.copy(alpha: 0.6)
		gradient.colors = [startingColor ?? UIColor.clear.cgColor, backgroundColor?.cgColor ?? UIColor.white.cgColor]
		gradient.locations = [0.0, 1.0]
		view.layer.insertSublayer(gradient, at: 0)
		image.addSubview(view)
		image.bringSubviewToFront(view)
		view.layoutSubviews()

	}

	func setupTitleLabel() {
		view.addSubview(titleLabel)
		titleLabel.translatesAutoresizingMaskIntoConstraints = false

		titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
		titleLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 15).isActive = true
		titleLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -15).isActive = true
	}


	func setupLabel() {
		view.addSubview(textLabel)
		textLabel.translatesAutoresizingMaskIntoConstraints = false

		textLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30).isActive = true
		textLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 15).isActive = true
		textLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -15).isActive = true
	}

}

extension DetailsCharacterViewController: IDetailsCharacterViewController
{
}

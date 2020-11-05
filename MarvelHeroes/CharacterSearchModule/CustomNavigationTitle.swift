//
//  CustomNavigationTitle.swift
//  MarvelHeroes
//
//  Created by Ekaterina Khudzhamkulova on 5.11.2020.
//  Copyright © 2020 Ekaterina. All rights reserved.
//

import Foundation
import UIKit

class CustomNavigationTitle: UIView
{

	private var titleLabel: UILabel = {
		let label = UILabel()
		label.textAlignment = .left
		label.font = .boldSystemFont(ofSize: 32)
		label.numberOfLines = 0
		label.backgroundColor = .clear
		label.text = "Heroes"
		label.textColor = .systemRed
		return label
	}()

	private var titleImageView: UIImageView = {
		let titleImageView = UIImageView(image: UIImage(named: "writer"))
		titleImageView.contentMode = .scaleAspectFit
		return titleImageView
	}()

	init() {
		super.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
		setup()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}




	func setup() {


//		NSLayoutConstraint.activate([
//			titleImageView.heightAnchor.constraint(equalToConstant: 20),
//			titleImageView.widthAnchor.constraint(equalToConstant: 20)
//			])

		titleImageView.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
		let stackView = UIStackView(arrangedSubviews: [titleImageView, titleLabel])
		stackView.axis = .horizontal
		stackView.distribution = .fillProportionally
		stackView.alignment = .center
		stackView.spacing = 5
		translatesAutoresizingMaskIntoConstraints = false
	}

}

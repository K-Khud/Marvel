//
//  DummyView.swift
//  MarvelHeroes
//
//  Created by Ekaterina Khudzhamkulova on 11.11.2020.
//  Copyright © 2020 Ekaterina. All rights reserved.
//

import Foundation
import UIKit

class DummyView: UIView
{
	private var image = UIImageView(image: UIImage(named: "search_stub"))
	
	var label: UILabel = {
		let label = UILabel()
		label.textAlignment = .center
		label.font = .systemFont(ofSize: 20)
		label.numberOfLines = 0
		label.backgroundColor = .clear
		label.textColor = UIColor(named: "headerTitleColor")
		return label
	}()

	init(frame: CGRect, queryText: String) {
		super.init(frame: frame)
		label.text = "\(label.text ?? "") \(queryText)"
		configureContents()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private func configureContents() {
		self.backgroundColor = UIColor(named: "headerColor")

		image.translatesAutoresizingMaskIntoConstraints = false
		label.translatesAutoresizingMaskIntoConstraints = false

		self.addSubview(image)
		self.addSubview(label)

		image.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
		image.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true

		label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
		label.topAnchor.constraint(equalTo: image.bottomAnchor).isActive = true
		label.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -20).isActive = true
	}
}

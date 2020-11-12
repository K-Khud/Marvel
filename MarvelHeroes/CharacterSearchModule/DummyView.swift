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

	private var image: UIImageView = {
		let imageView = UIImageView(image: UIImage(named: "search_stub"))
		return imageView
	}()
	
	private var label: UILabel = {
		let label = UILabel()
		label.textAlignment = .center
		label.font = .systemFont(ofSize: 20)
		label.numberOfLines = 0
		label.backgroundColor = .clear
		label.text = "No matches for query"
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

		let stackView = UIStackView(arrangedSubviews: [image, label])
		stackView.translatesAutoresizingMaskIntoConstraints = false
		stackView.axis = .vertical
		stackView.alignment = .center
		stackView.distribution = .fill
//		stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
//		stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
//		stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
//		stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
		self.addSubview(stackView)
	}
}

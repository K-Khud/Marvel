//
//  ComicsSearchModule.swift
//  MarvelHeroes
//
//  Created by Ekaterina Khudzhamkulova on 11.11.2020.
//  Copyright © 2020 Ekaterina. All rights reserved.
//

import Foundation
import UIKit

protocol IComicsSearchViewController: AnyObject
{
}

class ComicsSearchViewController: UIViewController {

	let presenter: ComicsSearchPresenter

	var textLabel = UILabel()

	init(presenter: ComicsSearchPresenter) {
		self.presenter = presenter
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func viewDidLoad() {
		super.viewDidLoad()
	}

}

extension ComicsSearchViewController: IComicsSearchViewController {
}

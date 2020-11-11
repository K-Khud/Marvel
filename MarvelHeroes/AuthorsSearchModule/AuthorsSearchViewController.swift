//
//  AuthorsSearchModule.swift
//  MarvelHeroes
//
//  Created by Ekaterina Khudzhamkulova on 11.11.2020.
//  Copyright © 2020 Ekaterina. All rights reserved.
//

import Foundation
import UIKit

protocol IAuthorsSearchViewController: AnyObject
{
}

class AuthorsSearchViewController: UIViewController {

	let presenter: AuthorsSearchPresenter

	var textLabel = UILabel()

	init(presenter: AuthorsSearchPresenter) {
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

extension AuthorsSearchViewController: IAuthorsSearchViewController
{

}

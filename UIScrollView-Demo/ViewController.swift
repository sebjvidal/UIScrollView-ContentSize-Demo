//
//  ViewController.swift
//  UIScrollView-Demo
//
//  Created by Seb Vidal on 16/07/2023.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Private Properties
    private var scrollView: UIScrollView!
    
    // MARK: - init(nibName:bundle:)
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        view.backgroundColor = .systemBackground
        setupScrollView()
        setupScrollViewSubviews()
    }
    
    // MARK: - init?(coder:)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func setupScrollView() {
        scrollView = UIScrollView()
        scrollView.alwaysBounceVertical = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scrollView)
        setContentScrollView(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor)
        ])
    }
    
    private func setupScrollViewSubviews() {
        // Setting scrollView.contentSize works
//        let view1 = UIView()
//        view1.backgroundColor = .tertiarySystemFill
//        view1.frame = CGRect(x: 16, y: 0, width: view.frame.width - 32, height: 300)
//
//        scrollView.addSubview(view1)
        
        // Setting scrollView.contentSize does not work
        let view1 = UIView()
        view1.backgroundColor = .tertiarySystemFill
        view1.translatesAutoresizingMaskIntoConstraints = false

        scrollView.addSubview(view1)

        NSLayoutConstraint.activate([
            view1.topAnchor.constraint(equalTo: scrollView.topAnchor),
            view1.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            view1.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            view1.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -32),
            view1.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    // MARK: - viewDidLayoutSubviews()
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        updateScrollViewContentSize()
    }
    
    private func updateScrollViewContentSize() {
        let width = view.frame.width
        let height = view.frame.height * 2
        scrollView.contentSize = CGSize(width: width, height: height)
    }
}

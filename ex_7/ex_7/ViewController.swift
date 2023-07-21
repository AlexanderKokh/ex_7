//
//  ViewController.swift
//  ex_7
//
//  Created by Кох Александр Станиславович on 21.07.2023.
//

import UIKit

final class ViewController: UIViewController {

    private let imageViewHeight: CGFloat = 300
    private let imageView = UIImageView(image: UIImage(named: "combo"))
    private let scrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = view.bounds
        imageView.frame = CGRect(x: .zero, y: -scrollView.safeAreaInsets.top, width: scrollView.frame.width, height: imageViewHeight)
        scrollView.contentSize = .init(width: view.frame.width, height: 1500)
    }
    
    private func configure() {
        view.addSubview(scrollView)
        scrollView.delegate = self
        imageView.contentMode = .scaleAspectFill
        scrollView.addSubview(imageView)
    }
}

extension ViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let ySpacing = scrollView.contentOffset.y + scrollView.safeAreaInsets.top
        if ySpacing < 0 {
            imageView.frame = .init(x: .zero, y: -scrollView.safeAreaInsets.top + ySpacing, width: scrollView.frame.width, height: imageViewHeight + abs(ySpacing))
        }
        scrollView.verticalScrollIndicatorInsets.top = imageView.frame.height - scrollView.safeAreaInsets.top
    }
}

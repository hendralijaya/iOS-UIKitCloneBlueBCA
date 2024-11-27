//
//  CarouselOpeningViewController.swift
//  CloneBlueBCA
//
//  Created by hendra on 27/11/24.
//

import UIKit

class CarouselOpeningViewController: UIViewController {
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()
    
    var slides: [Slide] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupScrollView()
        layoutView()
        setupSlides()
        setupPageControl()
    }
    
    func setupView() {
        view.addSubview(scrollView)
        view.addSubview(pageControl)
        view.backgroundColor = UIColor.lightGray
    }
    
    func setupScrollView() {
        scrollView.delegate = self
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.showsHorizontalScrollIndicator = false
    }
    
    func setupSlides() {
        slides = createSlides()
        setupSlideScrollView(slides: slides)
    }
    
    func setupPageControl() {
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
        view.bringSubviewToFront(pageControl)
    }
    
    func layoutView() {
        layoutScrollView()
        layoutPageControl()
    }
    
    func layoutScrollView() {
        NSLayoutConstraint.activate([
            scrollView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            scrollView.heightAnchor.constraint(equalTo: view.heightAnchor),
        ])
    }
    
    func layoutPageControl() {
        NSLayoutConstraint.activate([
            pageControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: view.frame.height * -0.3),
            pageControl.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
        pageControl.pageIndicatorTintColor = .darkGray
        pageControl.currentPageIndicatorTintColor = .systemBlue
    }
}

extension CarouselOpeningViewController {

    func setupSlideScrollView(slides : [Slide]) {
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)
        scrollView.isPagingEnabled = true

        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            scrollView.addSubview(slides[i])
        }
    }
}

extension CarouselOpeningViewController: UIScrollViewDelegate {
    
    func createSlides() -> [Slide] {

        let slide1: Slide = Slide()
        slide1.imageView.image = UIImage(systemName: "car")
        slide1.titleLabel.text = "Car"
        slide1.descriptionLabel.text = "Represents a filled car, ideal for illustrating themes related to transportation or vehicles."
//        slide1.backgroundColor = .lightGray

        let slide2: Slide = Slide()
        slide2.imageView.image = UIImage(systemName: "heart")
        slide2.titleLabel.text = "Heart"
        slide2.descriptionLabel.text = "A filled heart symbolizing love, health, or favorite "

        let slide3: Slide = Slide()
        slide3.imageView.image = UIImage(systemName: "star")
        slide3.titleLabel.text = "Star"
        slide3.descriptionLabel.text = "A filled star often used to represent favorites or achievements."

        let slide4: Slide = Slide()
        slide4.imageView.image = UIImage(systemName: "sun.max")
        slide4.titleLabel.text = "Sun"
        slide4.descriptionLabel.text = "A filled sun symbol, commonly used to indicate brightness or weather."

        let slide5: Slide = Slide()
        slide5.imageView.image = UIImage(systemName: "house")
        slide5.titleLabel.text = "House"
        slide5.descriptionLabel.text = "Represents a filled house, often associated with themes of homes and real estate."

        return [slide1, slide2, slide3, slide4, slide5]
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(pageIndex)
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        setupSlideScrollView(slides: slides)
    }
}

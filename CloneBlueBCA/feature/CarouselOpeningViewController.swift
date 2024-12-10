//
//  CarouselOpeningViewController.swift
//  CloneBlueBCA
//
//  Created by hendra on 27/11/24.
//

import UIKit

class CarouselOpeningViewController: UIViewController {

    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "blu"
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "star.fill")
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let headerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 16
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.backgroundColor = .clear
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let startButton: BluButton = {
        let button = BluButton()
        button.setLabelText("Yuk Mulai!")
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
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
        navigationController?.setNavigationBarHidden(true, animated: false)
        setupView()
        setupScrollView()
        layoutView()
        setupSlides()
        setupPageControl()
    }
    
    func setupView() {
        headerStackView.addArrangedSubview(titleLabel)
        headerStackView.addArrangedSubview(imageView)
        view.addSubview(headerStackView)
        view.addSubview(scrollView)
        view.addSubview(pageControl)
        view.addSubview(startButton)
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
        layoutHeaderStackView()
        layoutButtonStartView()
    }
    
    func layoutScrollView() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: headerStackView.bottomAnchor, constant: 16),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6)
        ])
    }
    
    func layoutPageControl() {
        NSLayoutConstraint.activate([
            pageControl.topAnchor.constraint(equalTo: scrollView.bottomAnchor),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControl.heightAnchor.constraint(equalToConstant: 20)
        ])
        pageControl.pageIndicatorTintColor = .darkGray
        pageControl.currentPageIndicatorTintColor = .systemBlue
    }
    
    func layoutHeaderStackView() {
        NSLayoutConstraint.activate([
            headerStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            headerStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            headerStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
        ])

        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 40),
            imageView.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func layoutButtonStartView() {
        NSLayoutConstraint.activate([
            startButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            startButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            startButton.topAnchor.constraint(equalTo: pageControl.bottomAnchor, constant: 16),
        ])
        
        startButton.addTarget(self, action: #selector(startButtonPressed), for: .touchUpInside)
    }
    
    @objc func startButtonPressed() {
        let nextViewController = TesViewController()
        navigationController?.pushViewController(nextViewController, animated: true)
    }
}



extension CarouselOpeningViewController {

    func setupSlideScrollView(slides : [Slide]) {
        let scrollViewHeight = view.frame.height * 0.6
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: scrollViewHeight)
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: scrollViewHeight)
        scrollView.isPagingEnabled = true

        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: scrollViewHeight)
            scrollView.addSubview(slides[i])
        }
    }
}

extension CarouselOpeningViewController: UIScrollViewDelegate {
    
    func createSlides() -> [Slide] {

        let slide1: Slide = Slide()
        slide1.imageView.image = UIImage(systemName: "car")
        slide1.titleLabel.text = "Mulai Langkahmu Bareng blu!"
        slide1.descriptionLabel.text = "Untuk hidup lebih mudah dan terkoneksi apa pun tujuanmu"

        let slide2: Slide = Slide()
        slide2.imageView.image = UIImage(systemName: "heart")
        slide2.titleLabel.text = "Nabung Bebas Biaya Admin✨"
        slide2.descriptionLabel.text = "Mulai langkahmu, nabung dengan bunga 3%. Bayar-bayar juga lebih gampang!"

        let slide3: Slide = Slide()
        slide3.imageView.image = UIImage(systemName: "star")
        slide3.titleLabel.text = "bluVirtual & bluDebit Card Bikin Transaksi Lebih Mudah💳"
        slide3.descriptionLabel.text = "Mulai dari belanja online, offline, bayar tagihan, bisa! Terkoneksi dengan bluAccount sebagai sumber dana utama"

        let slide4: Slide = Slide()
        slide4.imageView.image = UIImage(systemName: "sun.max")
        slide4.titleLabel.text = "Pakai blu, \nEnjoy bluRewards!"
        slide4.descriptionLabel.text = "Nikmati bebas biaya transfer sampai cashback denan terus bertransaksi pakai blu!"

        return [slide1, slide2, slide3, slide4]
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(pageIndex)
        updateBackgroundColor(for: Int(pageIndex))
    }
    
    private func updateBackgroundColor(for pageIndex: Int) {
            switch pageIndex {
            case 0:
                view.backgroundColor = UIColor.gray
            case 1:
                view.backgroundColor = UIColor.yellow
            case 2:
                view.backgroundColor = UIColor.purple
            case 3:
                view.backgroundColor = UIColor.blue
            default:
                view.backgroundColor = UIColor.lightGray
            }
        }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        setupSlideScrollView(slides: slides)
    }
}

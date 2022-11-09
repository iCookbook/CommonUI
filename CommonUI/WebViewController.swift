//
//  WebRecipeViewController.swift
//  RecipeDetails
//
//  Created by Егор Бадмаев on 08.11.2022.
//

import UIKit
import WebKit
import Resources

public final class WebViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private let url: URL
    
    private lazy var webView: WKWebView = {
        let webView = WKWebView()
        webView.navigationDelegate = self
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    private lazy var toolBar: UIToolbar = {
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        toolBar.items = [backButton, spacer, forwardButton, spacer, shareButton, spacer, safariButton]
        toolBar.translatesAutoresizingMaskIntoConstraints = false
        return toolBar
    }()
    
    private lazy var backButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: Images.RecipeDetails.chevronBackward, style: .plain, target: self, action: #selector(backwardAction))
        button.isEnabled = false
        return button
    }()
    private lazy var forwardButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: Images.RecipeDetails.chevronForward, style: .plain, target: self, action: #selector(forwardAction))
        button.isEnabled = false
        return button
    }()
    private lazy var shareButton = UIBarButtonItem(image: Images.RecipeDetails.share, style: .plain, target: self, action: #selector(shareAction))
    private lazy var safariButton = UIBarButtonItem(image: Images.RecipeDetails.safari, style: .plain, target: self, action: #selector(safariAction))
    private lazy var spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
    
    // MARK: - Life Cycle
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: Images.RecipeDetails.chevronBackward, style: .plain, target: self, action: #selector(dismissThisVC))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: Images.RecipeDetails.reload, style: .plain, target: self, action: #selector(reloadPage))
        
        loadRequest(url: url)
        setupView()
    }
    
    // MARK: - Init
    
    public init(url: URL) {
        self.url = url
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func loadRequest(url: URL) {
        let urlRequest = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 5.0)
        webView.load(urlRequest)
    }
    
    private func setupView() {
        view.addSubview(webView)
        view.addSubview(toolBar)
        
        NSLayoutConstraint.activate([
            webView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            webView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            toolBar.topAnchor.constraint(equalTo: webView.bottomAnchor),
            toolBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            toolBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            toolBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    @objc private func dismissThisVC() {
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - UIBarButtonItems @objc methods

private extension WebViewController {
    
    @objc func backwardAction() {
        guard webView.canGoBack else { return }
        webView.goBack()
    }
    
    @objc func forwardAction() {
        guard webView.canGoForward else { return }
        webView.goForward()
    }
    
    @objc func shareAction() {
        let activityController = UIActivityViewController(activityItems: [url], applicationActivities: nil)
        activityController.excludedActivityTypes = [.markupAsPDF, .openInIBooks, .print, .saveToCameraRoll, .assignToContact]
        present(activityController, animated: true, completion: nil)
    }
    
    @objc func safariAction() {
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    @objc func reloadPage() {
        webView.reload()
    }
}

// MARK: - WKNavigationDelegate

extension WebViewController: WKNavigationDelegate {
    
    public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
        backButton.isEnabled = webView.canGoBack
        forwardButton.isEnabled = webView.canGoForward
    }
}

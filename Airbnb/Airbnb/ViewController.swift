//
//  ViewController.swift
//  Airbnb
//
//  Created by KingCQ on 2017/2/20.
//  Copyright © 2017年 KingCQ. All rights reserved.
//

import UIKit
import AutoCycleAdview
import ReactiveCocoa
import ReactiveSwift

class ViewController: UIViewController {
    var banner: AutoCycleAdview!
    var bannerItems: [BannerItem] = [] {
        didSet {
            let imagUrls = bannerItems.flatMap({ $0.img })
            let titles = bannerItems.flatMap({ $0.name })
            self.banner.imagUrls = imagUrls
            self.banner.titles = titles
            self.banner.pageControlAlignment = .right
            self.banner.callback = { [weak self] index in
                print(index, "🌹", "\(self)")
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        banner = AutoCycleAdview(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: UIScreen.main.bounds.width, height: 180)))
        view.addSubview(banner)
        let call = Call<BannerRootClass<BannerItem>>(uri: "http://www.oschina.net/action/apiv2/banner/?catalog=1")
        call.request { result in
            self.bannerItems = result.result?.items ?? []
        }
        
        let viewModel = ViewModel()
        viewModel.content { (result: BannerRootClass<BannerItem>) in
            self.bannerItems = result.result?.items ?? []
        }
//        viewModel.banner().startWithSignal { signal, disposable in
//            signal.observeResult({ result in
//                result.analysis(ifSuccess: { response in
//                    self.bannerItems = response.result?.items ?? []
//                    print(response.result?.items ?? [])
//                }, ifFailure: { error in
//                    
//                })
//            })?.dispose()
//        }
//        let subscriber = Observer<BannerRootClass<BannerItem>, NSError>(value: { response in
////            self.bannerItems = $0.result?.items ?? []
//        })
//        viewModel.banner().start(subscriber)
//        let strUrl = "https://raw.githubusercontent.com/tristanhimmelman/AlamofireObjectMapper/2ee8f34d21e8febfdefb2b3a403f18a43818d70a/sample_keypath_json"
//        
//        let filePath = Bundle.main.path(forResource: "airbnb", ofType: "json")
//        let url = URL(string: "file://\(filePath!)")!
//        let json = try! Data(contentsOf: url)
//        let jsonData = try! JSONSerialization.jsonObject(with: json, options: .allowFragments)
//        let part = JSON(data: json)
//      
//        
//        print("🌹\((part["explore_tabs"].first!.1["sections"].first?.1["articles"].first?.1["additional_cover_images"].first?.1)!)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}



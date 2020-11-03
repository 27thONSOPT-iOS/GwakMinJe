//
//  ViewController.swift
//  SOPTweek3
//
//  Created by 곽기곤's Mac on 2020/11/02.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if section == 0 {
            
            return 1
        } else{
            
            return profileList.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.section {
        
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bannerCell", for: indexPath)
            
            return cell
            
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "profileCell", for: indexPath) as? ModelCollectionViewCell else {
                
                return UICollectionViewCell()
            }
            cell.setProfile(image: profileList[indexPath.row].image, name: profileList[indexPath.row].name, message: profileList[indexPath.row].message)
            
            return cell
            
        default:
            return UICollectionViewCell()
        }
    }
    
    @IBOutlet weak var profileCollectionView: UICollectionView!
    
    var profileList: [Profile] = []

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        profileCollectionView.delegate = self
        profileCollectionView.dataSource = self
        
        setProfiles()
    }
    
    func setProfiles() {
        
        self.profileList.append(contentsOf: [
            
            Profile.init(image: "juhyeok", name: "이주혁", message: "#hereis#아요#내꿈은#사과농장#ENFP"),
            Profile.init(image: "nayeon", name: "김나연", message: "#이제막학기 #여러분들이랑_친해지고_싶어요#번개스터디환영"),
            Profile.init(image: "peace", name: "손평화", message: "#핸드피쓰 #이너피쓰 #배꼽도둑#헬린이 #sson_peace7"),
            Profile.init(image: "heesoo", name: "유희수", message: "#총무꿈나무 #유총무 #현재_소식중 #풉"),
            Profile.init(image: "saeeun", name: "박세은", message: "#마 #아요는 #처음입니다"),
            Profile.init(image: "wool", name: "한울", message: "#ENFP #STORM #울크박스 #@hwooolll #하늘콜렉터"),
            Profile.init(image: "hansol", name: "김한솔", message: "#고객중심#고객행동데이터기반한#UX디자이너#워너비,,"),
            Profile.init(image: "minju", name: "배민주", message: "#디팟장 #개자이너 #최종목표는행복"),
            Profile.init(image: "younghun", name: "최영훈", message: "#서팟짱 #솝트3회차 #앱잼_요리_개발자 #UX/UI"),
            Profile.init(image: "minguru", name: "강민구", message: "#밍맹 #안팟장 #이래뵈도_귀여운거좋아함 #지박령 #허당"),
            Profile.init(image: "yeonjeong", name: "이정연", message: "#플레이스픽 #ENFJ #기획_디자인_개발_다"),
            Profile.init(image: "junyeop", name: "홍준엽", message: "#26기서버 #27기웹 #샵이_두개면_어떻게될까? ##")
        ])
    }
}

extension ViewController : UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.section == 0 {
            
            return CGSize(width: 375, height: 420)
        } else {
            
        return CGSize(width: 150, height: 225)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
    UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
    UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
    UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        if section == 0 {
            
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        } else {
            
            return UIEdgeInsets(top: 41, left: 24, bottom: 0, right: 24)
        }
    }
}

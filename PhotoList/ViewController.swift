//
//  ViewController.swift
//  PhotoList
//
//  Created by JHJG on 2016. 3. 30..
//  Copyright © 2016년 KangJungu. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var bounds:CGRect?
    var width:CGFloat?
    var height:CGFloat?
    var ratio:CGFloat = 0;
    var result:CGFloat = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bounds = UIScreen.mainScreen().bounds
        if let a = bounds?.size.width{
            width = a
        }
        if let a = bounds?.size.height{
            height = a
            
        }
        
        
    }
    
    
    //섹션 갯수
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //커스텀뷰로 업케스팅을 해준다.
        //셀의 identifier와 indexPath를 넣어준다.
        let cell = tableView.dequeueReusableCellWithIdentifier("CUSTOM_CELL", forIndexPath: indexPath) as! MyTableViewCell
        
        cell.mImageView.image = UIImage(named: "\(indexPath.row).jpg")
        
//        var imageView:UIImageView?
//        
//        //사진 size 넣기
//        if let a = width{
//            imageView = UIImageView(frame: CGRectMake(0, 0, a, result));
//        }
//        
//        imageView!.image = cell.mImageView.image;
//        tableView.addSubview(imageView!);
        
        return cell
    }
    
    //숙제
    //동적으로 셀 사이즈가 조절이 안된다.
    //2가지방법
    //1. 오토레이아웃 이용
    //2. 밑에 함수를 쓰면됨(힌트 이미지뷰의 속성, 디바이스 스크린 사이즈(인터넷에 치면 나옴)도 알아야함
    //-> 비율로 줄이는것(ex) 핸드폰 넓이 100 사진 넓이 400 이면 1/4로 줄이고 높이도 1/4로 줄인다.(셀과 이미지뷰 둘다)))
    
    //셀 사이즈가 100만큼 고정된다.
    //한 셀마다 계산해서 넣어줌. indexPath를 가져와서 이미지를 가져와서 계산한뒤 넣어주면된다.
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        print(1)
        //오토레이아웃을 했을때는 이것으로 하면 알아서 맞춰줌.
        //return UITableViewAutomaticDimension
        let photo = UIImage(named: "\(indexPath.row).jpg")
        let photoWidth,photoHeight:CGFloat?
        
        photoWidth = photo?.size.width
        photoHeight = photo?.size.height
        print("photoWidth : \(photoWidth)")
        
        //사진 사이즈와 디바이스 사이즈를 가져와서 비율을 구한다.
        if let a = width{
            if let b = photoWidth{
                ratio = b/a
            }
        }
        
        //높이를 비율계산해서 넣어준다.
        if let a = photoHeight{
            result = a/ratio
        }
        print("width : \(width) result: \(result)")
        //사진 높이 결정해서 cell에 넣어준다.
        return result
        
    }
}


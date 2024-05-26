//
//  ViewController.swift
//  Storyboard List
//
//  Created by 松原涼一 on 2023/07/11.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // リストにしたい要素を配列にする　何を表示するのか？
    var array = [
        "北海道","青森県","岩手県","宮城県","秋田県","山形県","福島県",
        "茨城県","栃木県","群馬県","埼玉県","千葉県","東京都","神奈川県",
        "新潟県","富山県","石川県","福井県","山梨県","長野県","岐阜県",
        "静岡県","愛知県","三重県","滋賀県","京都府","大阪府","兵庫県",
        "奈良県","和歌山県","鳥取県","島根県","岡山県","広島県",
        "山口県","徳島県","香川県","愛媛県","高知県","福岡県","佐賀県",
        "長崎県","熊本県","大分県","宮城県","鹿児島県","沖縄県"]

   
    
    // 配列の要素数を取得(セルの行数を返す)　何個表示するのか？
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    // 表示するセル設定 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルを取得、再利用(.dequeueReusableCell())
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        // セルに値設定
        cell.textLabel?.text = array[indexPath.row]
        return cell
    }
}


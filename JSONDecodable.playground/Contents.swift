/*メモ
・{}で囲われたまとまりをオブジェクトと呼び、swiftでいうところの構造体というイメージ 1つの構造を表している
・"name"がキー、"さとう"が値
・PersonはDecodableプロトコルに批准することでデコードできる構造体になったことの宣言 この段階ではPerson型デコードできますよ！と表現しているだけ。
・宣言をしたらJSONDecoder()を使い、JSONはString型のデータなので、Data型に変換したData型の値を
 JSONDecoderの引数名fromに渡す。typeには変換したい型名を渡す
 ・json.data(using: .utf8)!の記述意味はJSON形式でとったデータを取ってきた、アプリの画面上(swiftで)
 表示したいのでUTF-8でエンコードされた文字列のデータに変換している
 ・パースとは、データを解析し、必要なデータを取り出すことです。例：JSONから必要なデータを取り出し、Swiftプログラムで利用できるようになる。
 
 
 
 */

import UIKit

//JSON形式のデータ

let json = """
{

    "name": "さとう",
    "age": 30,
    "bmi": 12.5,
    "item":["りんご", "みかん", "ばなな"],
}
"""

json

//JSON形式のデータをData型(UTF-8)に変換
let jsonData = json.data(using: .utf8)!
jsonData
// Strin型json
json

//JSON形式のデータをswiftで読み込む 取得するデータ型を構造体で定義 取得したいJSON形式のデータを元にstructを構築
//bmiのデータは開発者は必要ない場合

struct  Person: Decodable {
    var name: String
    var age: Int
}
//JSONをパースする処理
do {
    let result = try JSONDecoder().decode(Person.self, from: jsonData)
    result.age
    result.name
} catch {
    print(error)
}





import UIKit

// メモ
// .dateはString型の値を渡さないと、date型へフォーマットすることができない
// 現状使っているのはDataFormatterクラス
// 日付表示を固定できていない状態 固定日付を使うには明示的な記述方法を行わないといけない
//
let date = Date()// "3 Mar 2024 at 7:51 PM"
print(date)
print(Date())


var string: String

//
//ISO8601日付フォーマッター
let formatter = ISO8601DateFormatter()
//formatter.formatOptions.remove(.withDashSeparatorInDate) // オプション削除
string = formatter.string(from: date)
print(string) // "2024-03-03T10:53:47Z" (UTC)

if let JST = TimeZone(abbreviation: "JST") {
    var options: ISO8601DateFormatter.Options = [
        .withInternetDateTime,
        .withDashSeparatorInDate,
        .withColonSeparatorInTime,
//        .withColonSeparatorInTimeZone,
    ]
    options.remove([
//        .withYear, // 西暦 削除
//        .withMonth, // 月 削除
//        .withDay, // 日 削除
//        .withTimeZone // +09:00 削除
    ])
    string = ISO8601DateFormatter.string(from: date, timeZone: JST,formatOptions: options)
    print(string) // "2024-03-03T20:16:41+09:00 (JST)


    // 年　取得
    let calendar = Calendar(identifier: .gregorian)
    let year = calendar.component(.year, from: date) // 2024
    // 月　取得
    let month = calendar.component(.month, from: date) // 3
    // 日 取得
    let day = calendar.component(.day, from: date) // 4

    var strSetTime = "\(year)0\(month)0\(day)T\(string)"

    // 整形String型設定時刻
    print(strSetTime) // "2024-03-04T15:22:37(JST)

    // 文字列→Date変換
    //基本書式 "2024-03-03T20:16:41+09:00を stringへ渡す
    let dataSetTime = formatter.date(from: string)


    print(dataSetTime ?? "nill")        // detaへ変換すると-9:00時差

}

//
//let formatter2 = ISO8601DateFormatter()
//formatter2.date(from: "2018-09-18T02:00:00Z")
//

///// TimeZoneの設定（未設定の場合はGMTが採用される）
//formatter.timeZone = TimeZone(identifier: "Asia/Tokyo")
//let hoge = "Asia/Tokyo"
//
///// Date→文字列変換
//let strDate = ISO8601DateFormatter.string(from: Date(),timeZone: hoge)
//print(strDate)      // JST 2024-03-03T19:27:46+09:00

//JST表記フォーマット



///// 文字列→Date変換
//let date = formatter.date(from: strDate)
//print(date!)        // 2020-04-25 06:00:39 +0000
//
//











//// Date型デフォルト現時表記インスタンス
//let date1 = Date() // "3 Mar 2024 at 2:41 PM"
//
//
//
//// デフォルト表記から固定フォーマット定義 インスタンス生成
//let formatter1 = DateFormatter()
//formatter1.dateFormat = DateFormatter.dateFormat(fromTemplate: "HH:mm", options: 0, locale: Locale(identifier: "ja_JP"))
//
//
//// Date → String
//let nowStringydMMM = formatter1.string(from: date1)
//print(nowStringydMMM)
//
//
//// String → Date  データ取得の段階では時差はないが、次の処理では時差が生じて表記が変更される
//
//formatter1.timeZone = TimeZone(identifier: "Europe/London")//　ここで時差修正
//let nowDateydMMM = formatter1.date(from: nowStringydMMM) // Date型時差修正　取得
//print(nowDateydMMM!)
//
//
//let calendar = Calendar(identifier: .japanese)
//let EuropeLondon = calendar.component(.hour, from: nowDateydMMM!)
//let hour = calendar.component(.hour, from: date1)
//
//// 現時刻の何時の箇所が取得 "Europe/London"の現時刻のhourを取得してしまっている
//print(EuropeLondon)
//// フォーマットされていないデフォルトの現時刻から一部表記を取得できる
//print(hour)

//
//let f = DateFormatter()
//f.dateStyle = .none
//f.timeStyle = .medium
//let now = Date()
//print(f.string(from: now)) //16:36:46
//
//























//
//    let nowTime = formatter1.date(from: )
//
//    // Dateへ表記フォーマットすると時差が発生する
//    print(nowDateydMMM)
//
//    let calendar = Calendar(identifier: .japanese)
//    let hour = calendar.component(.hour, from: nowDateydMMM) // 10
//    print(hour) // 現時刻の何時の箇所が取得
//
//





//let cal = Calendar.current
//let comp = cal.dateComponents(
//    [Calendar.Component.year, Calendar.Component.month, Calendar.Component.day,
//     Calendar.Component.hour, Calendar.Component.minute, Calendar.Component.second],
//     from: date)
//
//comp.year // 2020
//comp.month // 5
//comp.day // 4
//comp.hour // 11
//comp.minute // 36
//comp.second // 53
//





//
//
//
//
//let ISOformat = ISO8601DateFormatter()
//let now = Date()
//print(now) // Deta型現時刻
//
//// 現時刻detaを渡す → 現時刻対応string 変換
////現deta型時刻と同じ時刻を表す ISO8601の文字列生成 時差未修正 "2024-03-05T12:49:05Z" zはUTC
//ISOformat.timeZone = TimeZone.init(abbreviation: "JST")
//let strNow = ISOformat.string(from: now)
//print(strNow)
//
//// 現時刻と一致しているISO8601形式の文字列を渡す 現時刻deta型取得 表記デフォルト
//var detaNow = ISOformat.date(from: strNow)
//print(TimeZone.current) // 現状のdeta型のタイムゾーン出力　"Asia/Tokyo (fixed)"
//print(detaNow) // deta型はUtCへ戻る"Optional(2024-03-05 14:34:17 +0000)
//// deta型変換されるとデフォルトに戻ることでUTCに一度変換される タイムゾーンの初期値は"Asia/Tokyo"に設定されている状態でこの時刻である。再度修正する
//


// Dateとして日付の増減
let text = "2021-12-06"
let formatter5 = ISO8601DateFormatter()
formatter5.formatOptions = [.withFullDate]

if let date = formatter5.date(from: text) {
    // byAddingで.dayで +1日 .yearで +1年 .hourで +1時間
  let nextDate = Calendar.current.date(byAdding: .hour, value: 9, to: date)! //1日増
    print(nextDate) // 2021-12-07 00:00:00 +0000 (元々のUTCから+1日)
  print(formatter5.string(from: nextDate))  // 2021-12-07
  print(ISO8601DateFormatter().string(from: nextDate))  // 2021-12-07T00:00:00Z
}





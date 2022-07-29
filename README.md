# **joyato**
* firebaseの設定ファイルandroidとiOSそれぞれダウンロードしフォルダに格納する
* devとprodを環境ごとにbuildする  
<br>

### *1 firebaseの設定ファイルandroidとiOSそれぞれダウンロードしフォルダに格納する*
-----  
<br>

1. firebaseコンソールに移動しjoyato-devとjoyato-prodのプロジェクトがあるか確認してください。  
2. 確認ができましたらdevとprodどちらからでも良いのでプロジェクトを開いてください。
<br>

    ※今回の説明ではdevを使用します。  
<br>

3. プロジェクトを開けたら左上に歯車のアイコンがあると思うのでそこを押しプロジェクトの設定を選択してください。選択したら下の方にマイアプリという欄があると思うのでAndroidアプリを選択しgoogle-services.jsonをダウンロードしてください。iOSの場合はAppleアプリのGoogleService-Info.plistをダウンロード。  
<br>

- 詳しくは下記を読んでください！  
- https://support.google.com/firebase/answer/7015592?hl=ja#zippy=%2C%E3%81%93%E3%81%AE%E8%A8%98%E4%BA%8B%E3%81%AE%E5%86%85%E5%AE%B9  
<br>

4. ダウンロードできたらandroid配下にあるdevフォルダにgoogle-services.jsonを入れてください。  
<br>
    
- iOSの場合はGoogleService-Info.plistをダウンロードしiOS配下にあるdevフォルダにGoogleService-Info.plistを入れる。

  - android/dev/google-service.json
  - android/prod/google-service.json
  - ios/dev/GoogleService-Info.plist
  - ios/prod/GoogleService-Info.plist  
  <br>

  上記のようになっていればOKです！同じ作業をjoyato-prodプロジェクトでも行います。  
<br>

- androidもiOSをやり方は共通です!  
  - androidのdevとprodフォルダにはgoogle-services.json  
  - iOSのdevとprodフォルダにはGoogleService-Info.plist








# **joyato**
* firebaseの設定ファイルandroidとiOSそれぞれダウンロードしフォルダに格納する
* devとprodを環境ごとにbuildする  
<br>

## はじめに  


<br>

 新しくチームに参加された方にビルドまでの手順を説明します。
 本プロジェクトではdevとprodの2つの開発環境を用意しています。
 それら2つの環境でiOSとAndroidのビルドができる状態にし、下記の画像のような状態を目指しましょう。
 - devアプリ名: joyato.dev
 - prodアプリ名: joyato


 ![画像の説明](assets/images/ios_icon.png)
 *iOS*
 ![画像の説明](assets/images/android_icon.png)
 *android*  
 <br>


## Firebase設定ファイルの適用

Firebaseの設定ファイルをダウンロードするためにjoyato-devとjoyato-prodプロジェクトに参加する必要があります。

- [joyato-dev](https://console.firebase.google.com/project/joyato-dev/overview?hl=ja)
- [joyato-prod](https://console.firebase.google.com/project/joyato-prod/overview?hl=ja)  
<br>

上記の2つのプロジェクトの閲覧権限がない場合はこんぶさんにDMしプロジェクトに招待してもらいましょう。  
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
  <br>



### *2 devとprodのビルドのやり方*
-----  
<br>

1. シュミレーターを開きターミナルで以下のコマンドを打ちます。
- dev: flutter run --dart-define=FLAVOR=dev
- dev: flutter run --dart-define=FLAVOR=prod  
<br>


それぞれビルドできたらアイコンとアプリ名が変わっていると思われます。
androidもiOSも共通のコマンドとやり方です。














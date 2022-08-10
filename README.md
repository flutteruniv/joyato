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

----
## API-KEY設定
1. project配下に「map_api_key.env」という名前でファイルを生成してください。
2. 生成したファイルに`MAP_API_KEY=使用するAPI-KEY`の形式で記載してください。
![API-KEY1](https://user-images.githubusercontent.com/102897585/183320130-b25ca973-9387-4c51-8476-ef6ee64912e9.png)
3. 次に/android/app/src/main/res/values/の配下に「keys.xml」という名前でファイルを生成してください。
4. 下記の<string...string>の間に使用するAPI-KEYを記載してください。
```
<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="google_maps_key" translatable="false"    templateMergeStrategy="preserve">
        
    </string>
</resources>
```
![API-KEY2](https://user-images.githubusercontent.com/102897585/183526980-07bafee2-b991-4366-aa72-8788f9934e3c.png)

※iOSの読み込みが不具合の場合、[こちらの記事](https://www.rect-angle.com/tech/flutter/flutter-env/)を参照しビルドスクリプトが正しく動作しているかを確認してください。

※Androidの読み込みが不具合の場合、[こちらの記事](https://medium.com/@ykaito21/flutter-from-zero-to-one-how-to-ignore-google-map-api-key-from-source-control-18e119ff5a47)を参照し、keys.xmlが生成されているか確認してください。













# joyato
devとprodを環境ごとにbuildする方法

1 firebaseの設定ファイルandroidとiOSそれぞれダウンロードしフォルダに格納する

・androidとiOSの設定方法の手順
(1) firebaseのコンソールに移動しjoyato-devとjoyato-prodプロジェクトがあるのを確認してください。

(2) 確認ができましたらdevとprodどちらからでも良いのでプロジェクトを開いてください。
※今回の説明ではdevを使用します。

プロジェクトを開けましたら左上に歯車のアイコンがあると思うのでそこを押しプロジェクトの設定を選択してください。選択したら下の方にマイアプリという欄があると思うのでAndroidアプリを選択しgoogle-services.jsonをダウンロードしてください。iOSの場合はAppleアプリのGoogleService-Info.plistをダウンロード。

(3) 先ほどダウンロードしたgoogle-services.jsonをandroidのdevフォルダに入れてください。
iOSはGoogleService-Info.plistをdevフォルダに入れる

- android/dev/google-service.json
- android/prod/google-service.json
- ios/dev/GoogleService-Info.plist
- ios/prod/GoogleService-Info.plist
上記のようになっていればOKです！同じ作業をjoyato-prodプロジェクトでも行います。

※ androidもiOSをやり方は共通です!
androidのdevとprodフォルダにはgoogle-services.json
iOSのdevとprodフォルダにはGoogleService-Info.plist


2 devとprodのビルドのやり方

(1) androidとiOSの方法

androidのシュミレーターを開きターミナルで以下のコマンドを打ちます。
- dev: flutter run --dart-define=FLAVOR=dev
- prod: flutter run --dart-define=FLAVOR=prod
それぞれビルドできたらアイコンとアイコン名が変わっていると思われます。

※ androidもiOSも共通のコマンドとやり方です






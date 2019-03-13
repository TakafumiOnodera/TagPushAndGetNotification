PhilosophyNotificationAppビルド前に

1. cocoapodがインストールされていない場合、ホームディレクトリで以下を実行

gem install cocoapods
(認証エラーが出た場合は　sudo gem install cocoapods)


2. アプリプロジェクト内部ディレクトリ(podファイルが入っている場所)で以下を実行

pod setup

3. 続けて、以下実行

pod init


4. 続けて、以下実行(事前準備はここで完了)

pod install


5. プロジェクトファイルは「PhilosophyNotificationApp.xcworkspace」を選択してxcodeを起動すること(白い背景のアイコン)
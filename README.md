■サービス概要
キャンプ計画サービスです。人数、キャンプ場住所や広さ、それぞれの持ち物などを確認し、内部チャットで相談できるサービスです。
ユーザー登録時にキャンプギアを登録し、グループ招待された時点で全体の持ち物が一覧で表示され、それを元に必要な道具、交通手段や
手配する車の台数、大きさ、それらの条件を満たすキャンプ場や予定をチャットで計画するサービスです。


■ このサービスへの思い・作りたい理由
私自身がキャンプが好きで、年に数回友達とキャンプするのですが、人数やキャンプ場をどこにするかなどをLINEで相談しています。
グループLINEではキャンプのこと以外もチャットするので、キャンプについての会話が途切れ途切れになったり、たくさん遡らないといけない
ということが多々あり、いろんな意見や予定を一つにまとめることができたらスムーズに計画することができるのではないかと考えました。
■ ユーザー層について
　２０代〜３０代をターゲットにします。キャンプギアは高価のものが多いので、特に20代は一式をすぐに揃えるのはハードルが高いと考えています。
　よってキャンプギアを共有することが多い年代層のほうが本サービスを使用するメリットが大きいと考えたからです。

■サービスの利用イメージ
　キャンプをしようと発案し、相談しながら計画する時に利用できるものと考えています。このサービスは持ち物を登録して共有、キャンプ場の候補をあげて投票とチャットで相談し
　キャンプ場を決定します。このサービスを利用するメリットは以下の通りです。
　・持ち物を登録しておくことで、当日に見返して自分の持ち物チェックになる。
　・荷物の多さによって手配する車の大きさや台数が変わってくることが想定され、キャンプサイトに乗り入れした時のイメージや駐車場の台数制限などの条件を
　　加味した、現実的なキャンプ場候補を上げることができる。
　・キャンプ計画の相談を目的としたチャットを設置することで、LINEなどのグループチャットでキャンプ計画の意見が疎らになることを防ぎます。
　・キャンプギアの重複を防ぎ、荷物を最小化できます。
　
  

■ ユーザーの獲得について
SEO対策とXでの発信を考えています。

■ サービスの差別化ポイント・推しポイント
類似サービス
・LINE
　　LINEでもキャンプの計画も可能です。チャットで相談や投票機能もありますが、このアプリではグループ全体の持ち物把握や予定確認などが可能です。
   LINEではキャンプ以外についてのトークも展開されるのでキャンプのことは当アプリでそれ以外はLINEというような役割になればと思います。
・CANP NOT
　　こちらのアプリはキャンプギアを写真付きで登録できるアプリで、持ち物チェックやプランも立てられるアプリです。
  　ソロ用とファミリー用でギアを登録でき、使い分けができるアプリです。差別化ポイントは持ち物を共有できてグループ全体の
   　荷物を把握することで、余分な荷物を省いたり、足りないギアを買い足したりすることができ、キャンプ場の広さや車の台数を考慮して
    キャンプ場選びを円滑に進めることができるので、当日のトラブルを減らすことができます。
■ 機能候補
MVPリリース時
・ユーザー登録機能
　　ユーザー名・パスワード・メールアドレスでユーザー登録します。
・マイページ機能
　　マイページは自分のアカウント情報の一覧とその編集ができます。その他にキャンプギア登録と所属グループ一覧が表示されて、リンクになっています。
・キャンプ場候補投票機能
　　キャンプ場の候補をいくつか挙げて、グループ全員で投票を行える機能です。住所やキャンプ場のURLなどを入力し候補を挙げて多数決で決定する機能です
・持ち物登録、共有機能
　　自分の持ち物をあらかじめ登録しておきます。グループが作成され、招集された段階で各人の持ち物が共有されます。
・チャット機能
　　グループ内チャットでキャンプ場の相談やキャンプ場に行くまでの予定などを相談できるところです。
・予定機能
　　キャンプ場までにいきたいところ、食材などの買い出し場所に行く予定、キャンプ場チェックアウト後の予定などを入力し、グループ内で共有します。
・グループ招待機能
　　グループのリンクを発行し、リンクを招待したい人に送付します。そのリンクを踏んで承認されれば、グループに追加されます。
本リリース時
　・LINE招待機能
 　　グループへの招待をLINEで送付し通知します。
 ・Line通知機能
   　チャットやキャンプ場候補が挙げられ投票が開始された時に、LINEに通知します。
　　
■ 機能の実装方針予定
　・キャンプ場候補投稿機能
 　　　Post（候補地提案）モデル、　Voteモデルを作成し、投稿フォームから候補を挙げて投稿期限が過ぎたら投票ボタンを表示させて投票してもらう投票期限が過ぎたら投票結果を表示させ　　　る。期限はGem wheneverを使用予定。  　
  ・持ち物登録、共有機能
  　　Belongingモデル（持ち物を登録するモデル）Groupモデル（グループ管理）とGroupMembership（グループメンバー管理）を作成し、グループの持ち物を表示させます。
  ・チャット機能
  　　ActionCableというフレームワークを使用して実装予定です。
  ・予定機能
  　　planモデルを作成しgroupモデルと紐づけて実装予定です。
  ・グループ招待機能
　　　Invitationモデルを作成し、ランダムなトークンを生成しユニークなリンクを生成します。
  ・LINE招待機能
  　　LINE Messaging APIを使用し、LINEで招待URLを送付します。

■ 画面遷移図
Figma：https://www.figma.com/design/D20fnYzweSKw3OZijDRLn2/Camplan-%E7%94%BB%E9%9D%A2%E9%81%B7%E7%A7%BB%E5%9B%B3?node-id=0-1&node-type=canvas&t=7CeuCRKE9tRxBiIe-0
import consumer from "./consumer"

// 「const chatChannel =」を追記
const chatChannel = consumer.subscriptions.create("GroupChannel", {
  // 省略

  // room_channel.rbでブロードキャストされたデータがreceivedに届き、アラート表示を実行。
  // アラート表示する内容は「data([‘message’])」
  // 「event.target.value」で取得したデータと同じ
  received(data) {
    return $('#messages').append(data['message']);
  },

  // 仮引数 function(message)のmessage
  // 実引数 event.target.value
  // room_channel.rbのspeakアクションを動かすために、speak関数を定義
  speak: function(message) {
    return this.perform('speak', {message: message});
  }
});

// フォーム内でEnterキーが押された時の動作を記述
// event.KeyCode === 13は非推奨となっているため、event.key === 'Enter'と変更
document.addEventListener('keypress', function(event) {
  const target = event.target;

  // data-behavior="group_speaker" を持つ要素か確認
  if (target.matches('[data-behavior~=group_speaker]') && event.key === 'Enter') {
    event.preventDefault(); // Enterキーによるデフォルト動作（フォーム送信など）を防止
    chatChannel.speak(target.value); // メッセージを送信
    target.value = ''; // 入力欄をクリア
  }
});
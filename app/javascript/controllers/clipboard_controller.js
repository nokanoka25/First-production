import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="clipboard"
export default class extends Controller {
  static targets = ["source"]

  copy() {
    navigator.clipboard.writeText(this.sourceTarget.textContent)
      .then(() => {
        alert('コピーしました！');
      })
      .catch((err) => {
        console.error('コピーに失敗しました', err);
      });
  }
}
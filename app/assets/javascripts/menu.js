// headerのハンバーガーメニュー
document.addEventListener("DOMContentLoaded", function() {
    document.getElementById("menuBtn").addEventListener("click", function() {
      this.classList.toggle("active");
      document.getElementById("menuNav").classList.toggle("active");
    })
  });
function showSearchBox() {
  if (document.getElementById("oneway").checked) {
    document.getElementById("return-date").style.display = "flex";
  } else {
    document.getElementById("return-date").style.display = "none";
  }
}

// ======================= dropdown-user =====================
document.addEventListener("DOMContentLoaded", function () {
  const userBtn = document.querySelector(".user-btn");
  const menu = document.querySelector(".dropdown-menu");

  if (!userBtn || !menu) return;

  userBtn.addEventListener("click", function (e) {
    e.stopPropagation();
    menu.classList.toggle("active");
  });

  document.addEventListener("click", function (e) {
    if (!menu.contains(e.target) && !userBtn.contains(e.target)) {
      menu.classList.remove("active");
    }
  });
});
// ======================= question-answer =====================
document.addEventListener("DOMContentLoaded", function () {
  const quesTitle = document.querySelectorAll(".question-title");
  quesTitle.forEach(function(title){
    title.addEventListener("click", function(){
      const answer = title.nextElementSibling;
      const arrow = title.querySelector(".question-arrow-item");
      answer.classList.toggle("active");
      arrow.classList.toggle("active");
    });
  });
});
// ======================= suggestion-search =====================
const searchInput = document.querySelectorAll(".searchInput");

searchInput.forEach((input) => {
  const suggestionBox = input.parentElement.querySelector(".suggestion");
  input.addEventListener("input", function () {
    let value = input.value.trim();
    suggestionBox.innerHTML = "";

    if (value === "") {
      suggestionBox.style.display = "none";
      return;
    }

    fetch("searchCity.php?q=" + encodeURIComponent(value))
      .then((response) => response.json())
      .then((data) => {
        if (data.length === 0) {
          suggestionBox.style.display = "none";
          return;
        }

        data.forEach((item) => {
          let div = document.createElement("div");
          div.classList.add("suggestion-item");
          div.innerHTML = `
      <strong>${item.thanh_pho} (${item.ma_iata})</strong>
      <div>${item.ten_san_bay}</div>
      <small>${item.quoc_gia}</small>`;

          div.onclick = function () {
            input.value = item.thanh_pho + " (" + item.ma_iata + ")";

            // tìm input hidden gần nhất
            const hiddenInput =
              input.parentElement.querySelector(".iata-value");
            hiddenInput.value = item.ma_iata;

            suggestionBox.style.display = "none";
          };

          suggestionBox.appendChild(div);
        });

        suggestionBox.style.display = "block";
      });
  });
});
// ======================= guest and chair =====================

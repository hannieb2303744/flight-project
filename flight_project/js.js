function showSearchBox() {
  if (document.getElementById("return").checked) {
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
  quesTitle.forEach(function (title) {
    title.addEventListener("click", function () {
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
      <strong>${item.TENDIADIEM} (${item.MADIADIEM})</strong>
      <div>${item.TENSANBAY}</div>
      <small>${item.QUOC_GIA}</small>`;

          div.onclick = function () {
            input.value = item.TENDIADIEM + " (" + item.MADIADIEM + ")";
            const hiddenInput =
              input.parentElement.querySelector(".iata-value");
            hiddenInput.value = item.MADIADIEM;

            suggestionBox.style.display = "none";
          };

          suggestionBox.appendChild(div);
        });

        suggestionBox.style.display = "block";
      });
  });
});
// ======================= date =====================4
document.addEventListener("DOMContentLoaded", function () {
  const departureInput = document.querySelector('input[name="departure-date"]');
  const returnInput = document.querySelector('input[name="return-date"]');

  if (!departureInput || !returnInput) return;
  const today = new Date();
  const yyyy = today.getFullYear();
  const mm = String(today.getMonth() + 1).padStart(2, "0");
  const dd = String(today.getDate()).padStart(2, "0");
  const todayStr = `${yyyy}-${mm}-${dd}`;

  departureInput.min = todayStr;
  returnInput.min = todayStr;

  departureInput.addEventListener("change", function () {
    returnInput.min = departureInput.value;
    if (returnInput.value < departureInput.value) {
      returnInput.value = "";
    }
  });
});

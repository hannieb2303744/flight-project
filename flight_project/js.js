function showSearchBox() {
  const roundtrip = document.getElementById("roundtrip");
  const returnBox = document.getElementById("return-date");
  const returnInput = returnBox?.querySelector('input[name="return_date"]');

  if (!roundtrip || !returnBox || !returnInput) return;

  if (roundtrip.checked) {
    returnBox.style.display = "flex";
    returnInput.setAttribute("required", "required");
  } else {
    returnBox.style.display = "none";
    returnInput.value = "";
    returnInput.removeAttribute("required");
  }
}

// ======================= dropdown-user =====================
document.addEventListener("DOMContentLoaded", function () {
  const userBtn = document.querySelector(".user-btn");
  const menu = document.querySelector(".dropdown-menu");

  if (userBtn && menu) {
    userBtn.addEventListener("click", function (e) {
      e.stopPropagation();
      menu.classList.toggle("active");
    });

    document.addEventListener("click", function (e) {
      if (!menu.contains(e.target) && !userBtn.contains(e.target)) {
        menu.classList.remove("active");
      }
    });
  }

  showSearchBox();
});

// ======================= question-answer =====================
document.addEventListener("DOMContentLoaded", function () {
  const quesTitle = document.querySelectorAll(".question-title");
  quesTitle.forEach(function (title) {
    title.addEventListener("click", function () {
      const answer = title.nextElementSibling;
      const arrow = title.querySelector(".question-arrow-item");
      if (answer) answer.classList.toggle("active");
      if (arrow) arrow.classList.toggle("active");
    });
  });
});

// ======================= suggestion-search =====================
const searchInput = document.querySelectorAll(".searchInput");

searchInput.forEach((input) => {
  const suggestionBox = input.parentElement.querySelector(".suggestion");
  const hiddenInput = input.parentElement.querySelector(".iata-value");

  input.addEventListener("input", function () {
    const value = input.value.trim();
    suggestionBox.innerHTML = "";

    if (value === "") {
      suggestionBox.style.display = "none";
      if (hiddenInput) hiddenInput.value = "";
      return;
    }

    fetch("searchCity.php?q=" + encodeURIComponent(value))
      .then((response) => response.json())
      .then((data) => {
        suggestionBox.innerHTML = "";

        if (!Array.isArray(data) || data.length === 0) {
          suggestionBox.style.display = "none";
          return;
        }

        data.forEach((item) => {
          const div = document.createElement("div");
          div.classList.add("suggestion-item");
          div.innerHTML = `
            <strong>${item.ma_san_bay} - ${item.ten_san_bay}</strong>
            <div>${item.ten_dia_diem}</div>
          `;

          div.onclick = function () {
            input.value = `${item.ma_san_bay} - ${item.ten_san_bay}`;
            if (hiddenInput) {
              hiddenInput.value = item.ma_san_bay;
            }
            suggestionBox.style.display = "none";
          };

          suggestionBox.appendChild(div);
        });

        suggestionBox.style.display = "block";
      })
      .catch(() => {
        suggestionBox.style.display = "none";
      });
  });

  input.addEventListener("blur", function () {
    setTimeout(() => {
      suggestionBox.style.display = "none";
    }, 200);
  });
});

// ======================= date =====================
document.addEventListener("DOMContentLoaded", function () {
  const departureInput = document.querySelector('input[name="departure_date"]');
  const returnInput = document.querySelector('input[name="return_date"]');

  if (!departureInput) return;

  const today = new Date();
  const yyyy = today.getFullYear();
  const mm = String(today.getMonth() + 1).padStart(2, "0");
  const dd = String(today.getDate()).padStart(2, "0");
  const todayStr = `${yyyy}-${mm}-${dd}`;

  departureInput.min = todayStr;
  if (returnInput) {
    returnInput.min = todayStr;
  }

  departureInput.addEventListener("change", function () {
    if (returnInput) {
      returnInput.min = departureInput.value;
      if (returnInput.value && returnInput.value < departureInput.value) {
        returnInput.value = "";
      }
    }
  });
});
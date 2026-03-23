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

// ======================= inputTo =====================4

document.querySelectorAll(".book-now").forEach((btn) => {
  btn.addEventListener("click", function (e) {
    const toInput = document.querySelector('input[name="to"]');
    const hiddenToCode = document.querySelector('input[name="to_code"]');
    const fromInput = document.querySelector('input[name="from"]');
    const toValue = this.dataset.to;
    toInput.value = toValue;

    const selectedOption = Array.from(
      document.querySelectorAll("#to-list option"),
    ).find((opt) => opt.value === toValue);
    if (selectedOption) {
      hiddenToCode.value = selectedOption.dataset.code;
    }
    fromInput.focus();
  });
});

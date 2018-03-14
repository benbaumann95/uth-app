const own_ticket = document.querySelectorAll(".own-ticket")
own_ticket.forEach((elem) => {
  elem.addEventListener("click", (event) => {
    window.alert("This is your ticket! You may remove your listing from Dashboard.")
  })
})

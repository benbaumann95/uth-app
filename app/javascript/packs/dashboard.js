const dashboardMainSection = document.querySelectorAll('.dashboard-main-section')

const listings_tab = document.getElementById("listings-tab");
listings_tab.addEventListener(("click"), (event) => {
  switch_active_class(listings_tab);
  dashboardMainSection[0].classList.remove('dashboard-hidden')
  dashboardMainSection[1].classList.add('dashboard-hidden')
  dashboardMainSection[2].classList.add('dashboard-hidden')
});

const bookings_tab = document.getElementById("bookings-tab");
bookings_tab.addEventListener(("click"), (event) => {
  switch_active_class(bookings_tab);
  dashboardMainSection[0].classList.add('dashboard-hidden')
  dashboardMainSection[1].classList.remove('dashboard-hidden')
  dashboardMainSection[2].classList.add('dashboard-hidden')
});

const watching_tab = document.getElementById("watching-tab");
watching_tab.addEventListener(("click"), (event) => {
  switch_active_class(watching_tab);
  dashboardMainSection[0].classList.add('dashboard-hidden')
  dashboardMainSection[1].classList.add('dashboard-hidden')
  dashboardMainSection[2].classList.remove('dashboard-hidden')
});

const switch_active_class = (tab) => {
  const current_active_class = document.querySelector('.active');
  current_active_class.classList.remove('active');
  tab.classList.add('active');
};

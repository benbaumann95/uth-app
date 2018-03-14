import swal from 'sweetalert';

function bindSweetAlertButtonDemo() {
  document.getElementById('sweet-alert-sell-ticket').addEventListener('click', () => {
    swal({
      title: "Awesome!",
      text: "You have successfully listed your ticket",
      icon: "success"
    })
  });
}

export { bindSweetAlertButtonDemo };

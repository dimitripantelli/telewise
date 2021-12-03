import swal from 'sweetalert'

import Popcorn from '../../assets/images/popcorn.png'
const popup_message = () => {
  document.addEventListener("turbolinks:load", () => {
    if (document.querySelector("#test")) {
      const myButton = document.querySelector("#test")
      myButton.addEventListener("click", event => {
        event.target.classList.add('d-none')
        swal({
          title: "Get your popcorn ready!",
          text: "You will get a notification when a new episode is out",
          icon: myButton.dataset.link,
          iconHtml: '<img src="https://picsum.photos/100/100">',
          className:  "sweet-alert"
        }).then(function () {
          // setTimeout(() => {
            // document.querySelector('#new_show').submit();
            location.reload()
          // }, 2000);

        });
      })
    }
  });
}

export { popup_message }

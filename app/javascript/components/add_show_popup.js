import swal from 'sweetalert'

const popup_message = () => {
  document.addEventListener("turbolinks:load", () => {
    if (document.querySelector("#test")) {
      const myButton = document.querySelector("#test")
      myButton.addEventListener("click", event => {
        event.target.classList.add('d-none')
        swal({
          title: "Get your popcorn ready!",
          text: "You will get a notification when a new episode is out",
          icon: "success",
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

document.addEventListener("click", function(event) {
  if (event.target.classList.contains("open-modal")) {
    event.preventDefault();
    console.log("open modal clicked");
    document.querySelector("#modal-image").src = event.target.querySelector("img").src;
    document.querySelector("#image-modal").style.display = "block";
  } else if (event.target.classList.contains("modal")) {
    console.log("modal clicked");
    document.querySelector("#image-modal").style.display = "none";
  }
});




// $(document).on('click', '.open-modal', function(event) {
//   event.preventDefault();
//   $('#modal-image').attr('src', $(this).find('img').attr('src'));
//   $('#image-modal').show();
// });

// $(document).on('click', '.modal', function(event) {
//   $('#image-modal').hide();
// });

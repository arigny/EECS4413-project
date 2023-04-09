//= require react
//= require react_ujs
//= require components
function talk() {
  var know = {
    "Hello. What is you name?": "My name is Eliza",
    "Do you already have an account on our website?":
      "Yes. I created one three months ago.",
    "What can I do to help you?": "I need some help to order some items.",
    "Do you want me to redirect you to your FAQ?. ":
      "Yes please, that would be so helpful",
    "Do you need further assistance?": "No. Thank You So Much.",
    "I am glad I was able to help. Goodbye":
      "Thank you so much for your assistance. Goodbye :)",
  };
  var user = document.getElementById("userBox").value;
  document.getElementById("chatLog").innerHTML = user + "<br>";
  if (user in know) {
    document.getElementById("chatLog").innerHTML = know[user] + "<br>";
  } else {
    document.getElementById("chatLog").innerHTML =
      "Sorry, I didn't understand <br>";
  }
}

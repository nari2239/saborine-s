function hover () {
  const userNavs = document.querySelectorAll(".user-nav");
  userNavs.forEach((userNav) => {
    userNav.addEventListener('mouseover', () => {
      userNav.setAttribute("style", "background-color:#F1940B;");
    });
    userNav.addEventListener('mouseout', () => {
      userNav.removeAttribute("style", "background-color:#F1940B;");
    });
  });
}

setInterval(hover, 1000);
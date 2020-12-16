function colorChange () {
  const colorChanges = document.querySelectorAll('.colorchange');
  colorChanges.forEach((colorChange) => {
    colorChange.addEventListener('mouseover', () => {
      colorChange.setAttribute("style", "background-color: #AAAAAA;");
    });
    colorChange.addEventListener('mouseout', () => {
      colorChange.removeAttribute("style", "background-color: #AAAAAA;")
    });
  });
}

setInterval(colorChange, 1000);
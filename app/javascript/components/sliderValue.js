const sliderValue = () => {
  const slider = document.getElementById('slider');
  const output = document.getElementById('value');

  if (slider) {
    output.innerHTML = slider.value;
  };

  const events = ["mousemove", "touchmove", "touchend"]

  events.forEach(e => slider?.addEventListener(e, () => {
      output.innerHTML = ((slider.value > 29) ? "30+" : Math.ceil(slider.value));
      const w = slider.offsetWidth;
      const x = (((w - 24) * slider.value / 30) + 12) / w * 100;
      slider.style.background = "linear-gradient(90deg, #153142 " + x + "%, #FEFEFA " + x + "%)";
      })
  );
}

const startSlider = () => {
  const w = slider.offsetWidth;
  const x = (((w - 24) * slider.value / 30) + 12) / w * 100;
  slider.style.background = "linear-gradient(90deg, #153142 " + x + "%, #FEFEFA " + x + "%)";
}

export { sliderValue, startSlider };

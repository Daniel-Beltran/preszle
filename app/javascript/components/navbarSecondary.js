const startSlider = (slider) => {
  const w = slider.offsetWidth;
  const x = (((w - 24) * slider.value / 15) + 12) / w * 100;
  slider.style.background = "linear-gradient(90deg, #153142 " + x + "%, #FEFEFA " + x + "%)";
}

function toggleSecondaryNavbar() {
  const readtime = document.querySelector('#readtime');
  const interests = document.querySelector('#interests');
  const readlists = document.querySelector('#readlists');
  const dashboard = document.querySelector('#dashboard');
  const readtimeNavbar = document.querySelector('#readtime-navbar');

  readtime?.addEventListener('click', () => {
    if (readtime)
      readtime.classList.toggle('text-info');
    if (interests && interests.classList.contains('text-info'))
      interests.classList.toggle('text-info');
    if (readtime && readlists.classList.contains('text-info'))
      readlists.classList.toggle('text-info');
    if (dashboard && dashboard.classList.contains('text-info'))
      dashboard.classList.toggle('text-info');
    if (readtimeNavbar)
      readtimeNavbar.classList.toggle('d-none');
    startSlider(slider);
  });

  interests?.addEventListener('click', () => {
    // toggle and untoggle the relevant navbar items
    if (readtime && readtime.classList.contains('text-info'))
      readtime.classList.toggle('text-info');
    if (interests)
      interests.classList.toggle('text-info');
    if (readlists && readlists.classList.contains('text-info'))
      readlists.classList.toggle('text-info');
    if (dashboard && dashboard.classList.contains('text-info'))
      dashboard.classList.toggle('text-info');
    if (readtimeNavbar && !readtimeNavbar.classList.contains('d-none'))
      readtimeNavbar.classList.toggle('d-none');
    // go to the page
  });
  readlists?.addEventListener('click', () => {
    if (readtime && readtime.classList.contains('text-info'))
      readtime.classList.toggle('text-info');
    if (interests && interests.classList.contains('text-info'))
      interests.classList.toggle('text-info');
    if (readlists)
      readlists.classList.toggle('text-info');
    if (dashboard && dashboard.classList.contains('text-info'))
      dashboard.classList.toggle('text-info');
    if (readtimeNavbar && !readtimeNavbar.classList.contains('d-none'))
      readtimeNavbar.classList.toggle('d-none');
  });
  dashboard?.addEventListener('click', () => {
    if (readtime && readtime.classList.contains('text-info'))
      readtime.classList.toggle('text-info');
    if (interests && interests.classList.contains('text-info'))
      interests.classList.toggle('text-info');
    if (readlists && readlists.classList.contains('text-info'))
      readlists.classList.toggle('text-info');
    if (dashboard)
      dashboard.classList.toggle('text-info');
    if (readtimeNavbar && !readtimeNavbar.classList.contains('d-none'))
      readtimeNavbar.classList.toggle('d-none');
  });
}

export { toggleSecondaryNavbar };

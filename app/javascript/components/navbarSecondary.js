const toggleSecondaryNavbar = () => {
  const readtime = document.querySelector('#readtime');
  const interests = document.querySelector('#interests');
  const readlists = document.querySelector('#readlists');
  const dashboard = document.querySelector('#dashboard');
  const readtimeNavbar = document.querySelector('#readtime-navbar')
  const interestsNavbar = document.querySelector('#interests-navbar')

  readtime.addEventListener('click', () => {
    readtimeNavbar.classList.toggle('d-none');
    if (interests.classList.contains('text-info')) interests.classList.toggle ('text-info');
    if (readlists.classList.contains('text-info')) readlists.classList.toggle('text-info');
    if (dashboard.classList.contains('text-info')) dashboard.classList.toggle('text-info');
    if (!interestsNavbar.classList.contains('d-none')) interestsNavbar.classList.toggle('d-none');
    readtime.classList.toggle('text-info');
  });
  interests.addEventListener('click', () => {
    if (readtime.classList.contains('text-info')) readtime.classList.toggle('text-info');
    interestsNavbar.classList.toggle('d-none');
    if (readlists.classList.contains('text-info')) readlists.classList.toggle('text-info');
    if (dashboard.classList.contains('text-info')) dashboard.classList.toggle('text-info');
    if (!readtimeNavbar.classList.contains('d-none')) readtimeNavbar.classList.toggle('d-none');
    interests.classList.toggle('text-info');
  });
  readlists.addEventListener('click', () => {
    if (readtime.classList.contains('text-info')) readtime.classList.toggle('text-info');
    if (interests.classList.contains('text-info')) interests.classList.toggle('text-info');
    readlists.classList.toggle('text-info');
    if (dashboard.classList.contains('text-info')) dashboard.classList.toggle('text-info');
    if (!interestsNavbar.classList.contains('d-none')) interestsNavbar.classList.toggle('d-none');
    if (!readtimeNavbar.classList.contains('d-none')) readtimeNavbar.classList.toggle('d-none');
  });
  dashboard.addEventListener('click', () => {
    if (readtime.classList.contains('text-info')) readtime.classList.toggle('text-info');
    if (interests.classList.contains('text-info')) interests.classList.toggle('text-info');
    if (readlists.classList.contains('text-info')) readlists.classList.toggle('text-info');
    dashboard.classList.toggle('text-info');
    if (!interestsNavbar.classList.contains('d-none')) interestsNavbar.classList.toggle('d-none');
    if (!readtimeNavbar.classList.contains('d-none')) readtimeNavbar.classList.toggle('d-none');
  });
}

export { toggleSecondaryNavbar };

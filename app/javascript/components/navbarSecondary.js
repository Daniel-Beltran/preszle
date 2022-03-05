const toggleSecondaryNavbar = () => {
  const readtime = document.querySelector('#readtime');
  const interests = document.querySelector('#interests');
  const readlists = document.querySelector('#readlists');
  const dashboard = document.querySelector('#dashboard');
  const readtimeNavbar = document.querySelector('#readtime-navbar')
  const interestsNavbar = document.querySelector('#interests-navbar')
  const dashboardNavbar = document.querySelector('#dashboard-navbar')

  readtime?.addEventListener('click', () => {
    if (readtime) readtime.classList.toggle('text-info');
    if (interests.classList.contains('text-info')) interests.classList.toggle ('text-info');
    if (readtime && readlists.classList.contains('text-info')) readlists.classList.toggle('text-info');
    if (dashboard.classList.contains('text-info')) dashboard.classList.toggle('text-info');
    if (readtimeNavbar) readtimeNavbar.classList.toggle('d-none');
    if (interestsNavbar && !interestsNavbar.classList.contains('d-none')) interestsNavbar.classList.toggle('d-none');
    if (dashboardNavbar && !dashboardNavbar.classList.contains('d-none')) dashboardNavbar.classList.toggle('d-none');
  });

  interests?.addEventListener('click', () => {
    if (readtime && readtime.classList.contains('text-info')) readtime.classList.toggle('text-info');
    if (interests) interests.classList.toggle('text-info');
    if (readlists.classList.contains('text-info')) readlists.classList.toggle('text-info');
    if (dashboard.classList.contains('text-info')) dashboard.classList.toggle('text-info');
    if (readtimeNavbar && !readtimeNavbar.classList.contains('d-none')) readtimeNavbar.classList.toggle('d-none');
    if (interestsNavbar) interestsNavbar.classList.toggle('d-none');
    if (dashboardNavbar && !dashboardNavbar.classList.contains('d-none')) dashboardNavbar.classList.toggle('d-none');
  });
  readlists?.addEventListener('click', () => {
    if (readtime && readtime.classList.contains('text-info')) readtime.classList.toggle('text-info');
    if (interests.classList.contains('text-info')) interests.classList.toggle('text-info');
    if (readlists) readlists.classList.toggle('text-info');
    if (dashboard.classList.contains('text-info')) dashboard.classList.toggle('text-info');
    if (readtimeNavbar && !readtimeNavbar.classList.contains('d-none')) readtimeNavbar.classList.toggle('d-none');
    if (interestsNavbar && !interestsNavbar.classList.contains('d-none')) interestsNavbar.classList.toggle('d-none');
    if (dashboardNavbar && !dashboardNavbar.classList.contains('d-none')) dashboardNavbar.classList.toggle('d-none');
  });
  dashboard?.addEventListener('click', () => {
    if (readtime && readtime.classList.contains('text-info')) readtime.classList.toggle('text-info');
    if (interests.classList.contains('text-info')) interests.classList.toggle('text-info');
    if (readlists.classList.contains('text-info')) readlists.classList.toggle('text-info');
    if (dashboard) dashboard.classList.toggle('text-info');
    if (readtimeNavbar && !readtimeNavbar.classList.contains('d-none')) readtimeNavbar.classList.toggle('d-none');
    if (interestsNavbar && !interestsNavbar.classList.contains('d-none')) interestsNavbar.classList.toggle('d-none');
    if (dashboardNavbar) dashboardNavbar.classList.toggle('d-none');
  });
}

export { toggleSecondaryNavbar };

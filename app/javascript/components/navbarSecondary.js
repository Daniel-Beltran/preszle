const toggleSecondaryNavbar = () => {
  const readtime = document.querySelector('#readtime');
  const interests = document.querySelector('#interests');
  const readlists = document.querySelector('#readlists');
  const dashboard = document.querySelector('#dashboard');
  const navbarSecondary = document.querySelector('#navbar-secondary')

  readtime.addEventListener('click', () => {
    console.log('readtime');
    navbarSecondary.classList.toggle('d-none');
    readtime.classList.toggle('text-info');
  });
  interests.addEventListener('click', () => {
    console.log('interests');
    navbarSecondary.classList.toggle('d-none');
    interests.classList.toggle('text-info');
  });
  readlists.addEventListener('click', () => {
    console.log('readlists');
    interests.classList.toggle('text-info');
  });
  dashboard.addEventListener('click', () => {
    console.log('dashboard');
    navbarSecondary.classList.toggle('d-none');
    dashboard.classList.toggle('text-info');
  });
}

export { toggleSecondaryNavbar };

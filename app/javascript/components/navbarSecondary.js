const toggleReadTimeSecondaryNavbar = () => {
  const readtime = document.querySelector('#readtime');
  const interests = document.querySelector('#interests');
  const readlists = document.querySelector('#readlists');
  const dashboard = document.querySelector('#dashboard');
  const navbarSecondary = document.querySelector('#navbar-secondary')


  readtime.addEventListener('click', () => {
    console.log('readtime');
  });
  interests.addEventListener('click', () => {
    console.log('interests');
  });
  readlists.addEventListener('click', () => {
    console.log('readlists');
  });
  dashboard.addEventListener('click', () => {
    console.log('dashboard');
    navbarSecondary.classList.toggle('d-none');
    dashboard.classList.toggle('text-info');
  });
}

export { toggleReadTimeSecondaryNavbar };

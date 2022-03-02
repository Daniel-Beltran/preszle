const selectInterests = () => {
  
  const checkButton = document.querySelectorAll(".form-check-input");
  const interestButton = document.querySelectorAll(".interest-button");


  checkButton.forEach((checkbox) => {
    if(checkbox.checked == true){  
      interestButton.forEach((interest) => {
        if(checkbox.id == interest.classList[1]){        
          interest.classList.add('selected-interest')
        };
      });
    }; 
  });  
  
  checkButton.forEach((check) => {
    interestButton.forEach((interest) => {
      if(check.id == interest.classList[1]){
        check.addEventListener("click", () => {
          interest.classList.toggle('selected-interest');
        });
      }
    });
  });

}


export { selectInterests };

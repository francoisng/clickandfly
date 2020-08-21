// Selectionner le bouton
// Selectionner l'input
// mettre un micro sur l'input

// quand evenement input est triger 
    // remove disable attribut on button

const enableButton = () => {
    
    const button_select = document.querySelector("#button-booking");
    const input_select = document.querySelector(".start_date");
    
    console.log(input_select);

    input_select.addEventListener('click', (event) => {
        console.log(event.currentTarget);
        button_select.disabled = false;
        
    });
}

export { enableButton }; 
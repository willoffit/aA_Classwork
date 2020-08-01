
const partyHeader = document.getElementById('party'); // <h1 id="party">Pocket Projects!</h1>

export const htmlGenerator = (string, htmlElement) => {

    const pTag = document.createElement("p");
    // const pText = document.createTextNode(string);
    pTag.innerHTML = string;
    htmlElement.appendChild(pTag);
};

htmlGenerator('Party Time.', partyHeader);
htmlGenerator('I <3 Vanilla DOM manipulation.', partyHeader);
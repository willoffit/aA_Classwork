{/* <nav class="drop-down-dog-nav">
  <h3>Here Are Some Dogs!</h3>
  <ul class="drop-down-dog-list">
  </ul>
</nav> */}


const dogs = {
  "Corgi": "https://www.akc.org/dog-breeds/cardigan-welsh-corgi/",
  "Australian Shepherd": "https://www.akc.org/dog-breeds/australian-shepherd/",
  "Affenpinscher": "https://www.akc.org/dog-breeds/affenpinscher/",
  "American Staffordshire Terrier": "https://www.akc.org/dog-breeds/american-staffordshire-terrier/",
  "Tosa": "https://www.akc.org/dog-breeds/tosa/",
  "Labrador Retriever": "https://www.akc.org/dog-breeds/labrador-retriever/",
  "French Bulldog": "https://www.akc.org/dog-breeds/french-bulldog/" 
};

const dogLinkCreator = function(dogs) {

  const dogNames = Object.keys(dogs);
  const dogLinks = [];

  dogNames.forEach((dogName) => {
    let aTag = document.createElement('a');
    aTag.innerHTML = dogName;
    aTag.setAttribute("href", dogs[dogName]);
    let liTag = document.createElement('li');
    liTag.className = 'dog-link';
    liTag.appendChild(aTag);
    dogLinks.push(liTag);
  });
  return dogLinks;
}

const attachDogLinks = function() {
  const dogLinks = dogLinkCreator(dogs);
  const dogList = document.querySelector(".drop-down-dog-list");


  dogLinks.forEach((dogLink) => {
    dogList.appendChild(dogLink);
  });
}

attachDogLinks();

const dogLinks = document.querySelectorAll('.dog-link');

const handleLeave = () => {
  dogLinks.forEach((dogLink) => {
    dogLink.style.display = "none";
  });
};

const handleEnter = () => {
  dogLinks.forEach((dogLink) => {
    dogLink.style.display = "block";
  });
};

const dogContainer = document.querySelector(".drop-down-dog-nav");
const dogH3 = document.getElementById("header");
dogH3.addEventListener("mouseover", handleEnter);
dogContainer.addEventListener("mouseleave", handleLeave);
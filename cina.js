







cina.events.humanDeclared()
.on("data", function(event) {
  let human = event.returnValues;
  // Nous pouvons accéder aux 3 valeurs de retour de cet évènement avec l'objet `event.returnValues` :
  console.log("Un nouveau propriétaire a été enregistré", human.cinaId, human._firstName, human._lastName, human._postalAddressLign1, human._postalAddressLign2, human._city, human._postalCode, human._phoneNumber);
}).on("error", console.error);

// le filtre est à coupler avec indexed 
cina.getPastEvents("humandeclared", { filter: { /*_to*/: userAccount } } { fromBlock: 0, toBlock: "latest" })
.then(function(events) {
  // `events` est un tableau d'objets `event` pour lequel nous pouvons itérer, comme nous l'avons fait ci-dessus

});

cina.getPastEvents("lifeEventDeclared", { fromBlock: 0, toBlock: "latest" })
.then(function(events) {

});


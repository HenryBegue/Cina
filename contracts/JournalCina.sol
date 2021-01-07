pragma solidity ^0.6.11;

import "./cina.sol";

//l'animal doit etre identifier avec son CinaId pour accéder à ces méthodes
//comment lié une méthode a une structure

contract AnimalMethods is Cina.sol {

    event humanDeclared (uint cinaId, string _firstName, string _lastName, string _postalAddressLign1, string _postalAddressLign2, string _city, string _postalCode, uint16 _phoneNumber);

    event lifeEventDeclared (string name, uint date, string comment);







    function addOrModifierOwner(string _firstName, string _lastName, string _postalAddressLign1, string _postalAddressLign2, string _city, string _postalCode, uint16 _phoneNumber) onlyOwner {
        
        //humans.push(Human(_firstName, _lastName, _postalAddressLign1, _postalAddressLign2, _city, _postalCode, _phoneNumber));
        //pas sûr que ce tableau soit util
        
        animalToOwner[cinaId] = Human(_firstName, _lastName, _postalAddressLign1, _postalAddressLign2, _city, _postalCode, _phoneNumber);    

        emit humanDeclared ( cinaId, _firstName, _lastName, _postalAddressLign1, _postalAddressLign2, _city, _postalCode, _phoneNumber);
    
    }
    
    /*function modifierOwner() onlyOwner {
        pas sûr que cette fonction soit utile

    }*/

    function addVet(string _firstName, string _lastName, string _postalAddressLign1, string _postalAddressLign2, string _city, string _postalCode, uint16 _phoneNumber, uint16 _vetOrderNumber) onlyOwner {
    //gestion d'une sorte de transaction avec le veto pour qu'il y ait son accord
        vets.push();
        animalToVet[cinaId] = Vet(_firstName, _lastName, _postalAddressLign1, _postalAddressLign2, _city, _postalCode, _phoneNumber);
    }

    function modifierVet()onlyOwner {
    //gestion d'une sorte de transaction avec le veto pour qu'il y ait son accord       
    }

    function addEmergencyContact() onlyOwner {

        humans.push;
        //pb de doublon

    }

    function modifierEmergencyContact() onlyOwner {

    }

    function addLifeEvent(string _name, uint _date, string _comment){
        emit lifeEventDeclared ( _name, _date, _comment);
    }
    
    //function retrouvable dans le ERC721
    function OwnerOf (uint _cinaId) public view returns (address _owner) {
    return animalToOwner[_cinaId];
        _firstName = animalToOwner[_cinaId].firstname;
        _lastName = lastName;
        _postalAddressLign1 = postalAddressLign1;
        _postalAddressLign2 = postalAddressLign2;
        _city = city;
        _postalCode = postalCode;
        _phoneNumber = phoneNumber;

    emit humanDeclared ( cinaId, _firstName, _lastName, _postalAddressLign1, _postalAddressLign2, _city, _postalCode, _phoneNumber);
    }
    

    
}
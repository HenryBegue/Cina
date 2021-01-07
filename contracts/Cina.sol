pragma solidity ^0.6.11;

import "../../openzeppelin-contracts-master/contracts/token/ERC721/ERC721.sol";
import "../../openzeppelin-contracts-master/contracts/utils/Counters.sol";
import "./ownable.sol";

contract Cina is ERC721, Ownable {

    using Counters for Counters.Counter;

    Counters.Counter private _cinaIds;
    Counters.Counter private _personIds;

    constructor () public ERC721 ("Identité numérique", "CINA") {}

    event NewAnimal();
    
    struct Human {
        string firstName;
        string lastName;
        string postalAddressLign1;
        string postalAddressLign2;
        string city;
        string postalCode;
        uint16 phoneNumber;
        //bool vet;
        //uint16 vetOrderNumber;
    }

    struct Vet {
        string firstName;
        string lastName;
        string postalAdress;
        uint16 phoneNumber;
        uint16 vetOrderNumber;
    }

    struct Animal {
        string tokenURI; // =name
        uint cinaID;
        uint dateOfBirth; // gestion des dates et des durées
        bool registeredVet;
        /*
        Person Owner ;
        Person emergencyContact ;
        Veto veto;
        ->   ces données partent en mapping
        */
    }

    enum typesOfMedicalAct {birth, vaccination, operation, sterilization, euthanasy, other }
    
    
    struct MedicalAct {
        //récupérer l'enumération
        uint vetOrderNumber;
        uint date;
        string comment;
    }
    
    struct LifeEvent {
        string name;
        uint date;
        string comment;
    }

    LifeEvent[] log;

    MedicalAct[] medicalFolder;

    Animal[] animals;

    //Human[] humans;

    Vet[] vets;


    // Dans ces mapping l'uint correspond au CinaID
    // ces champs n'ont pas d'obligation à être renseigné lors de la crétion de l'animal
    // si ces champs sont remplis ils peuvent être consultable par tous et sont inscrit dans la blockchain
    // -> adieu anonymat !!!!

            
        mapping (uint => Human) public animalToOwner;
            
        mapping (uint => Vet) public animalToVet;

        //mapping (uint => Human) public animalToVet;

            
        mapping (uint => Human) public animalToEmergencyContact;

        mapping (uint => journal) public animalLog;

        mapping (uint => medicalFolder) public animalmedicalfolder; 
        //animalmedicalfolder[4512]."fonction de tableau"() {};


    // mapping (uint => address) public animalToOwner;
   
    // mapping(uint=>Animal) CinaID;

    // mapping(address=>Person) Personlist;

    // mapping(Pet=>Person) Ownerpet;

    // mapping(Pet=>Person) Emergencycontactpet;


    function createPerson (string memory _personURI, string memory _name, string memory _postalAddress, uint _phoneNumber) public {
       Personlist[msg.sender] = Person (_personURI,_name, _postalAddress, _phoneNumber);

    }

    function addAnimal( string memory _tokenURI) internal returns (uint256) {

     //   require (msg.sender) address de la personne doit etre enregistrée

        _cinaIds.increment();
        uint256 newCinaId = _cinaIds.current();
        _mint(msg.sender, newCinaId);
        _setTokenURI(newCinaId, _tokenURI);
        // ERC 721. sol mapping (uint256 => string) private _tokenURIs;

        //animals.push(Animal(tokenURI,newCinaId));
        // CinaID[newCinaId]= Pet (_petURI,newCinaId,_petName );
        emit NewAnimal();
        return newCinaId;
    }
}
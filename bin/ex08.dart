import 'package:ex08/fonction.dart';
part 'ex08var.dart';

main() {
//Numero 1
  print('Numero 1');
  print('Association IS (1)');
  print(sortByFName(associations[0]['members']));
  print(sortByLName(associations[0]['members']));


  print('\nAssociation CS (2)');
  print(sortByFName(associations[1]['members']));
  print(sortByLName(associations[1]['members']));


  print(findByLetter(associations, 'N'));
  print(findByLetter(associations, 'R'));
  print(findByLetter(associations, 'C'));

  print('-----------------');
  //numéro 2
  print('Numero 2');

  var myAssociations = [];
  var myMembers = [];
  var member1 = new Member('Olivier', 'Farouche', 'oliF@hotmail.com');
  myMembers.add(member1);
  var member2 = new Member('Louis', 'coté', 'yo@hotmail.com');
  myMembers.add(member2);
  var membre3 = new Member('Margo', 'Ross', 'tomate@gmail.com');
  myMembers.add(member2);

  var asso1 = new Association('CS', 'Computer Science');
  myAssociations.add(asso1);

  for (var i = 0; i < myMembers.length; i++) {
    asso1.addMember(myMembers[i]);
  }
  asso1.removeMember('email');

  var asso2 = new Association('Ad', 'Admin');
  var member4 = new Member('PO', 'cote', 'pocote@gmail.com');
  myMembers.add(member4);
  asso2.addMember(member4);
  //Update le email de la personne trouvé
  asso2.updateMember('pocote2@gmail.com', 'PO', 'cote');
  myAssociations.add(asso2);

  print('Liste Associations avec membres');
  for (var i = 0; i < myAssociations.length; i++) {
    print(myAssociations[i].toString());
    print(myAssociations[i].MemberstoString());
    print('-----------------');
  }

  print('Liste membres avec assocition');
  for (var i = 0; i < myMembers.length; i++) {
    print(myMembers[i].toString());
    print(myMembers[i].MembershipstoString());
    print('-----------------');
  }
}

library fonction;

sortByFName(var members) {
  var message= '';
  message +='\nClassement par prénom\n';
  members.sort((a, b) => a['firstName'].compareTo(b['firstName']));

  for (var i in members) {
    message+= '\n';
    message += i.toString();

  }
return message;
}

sortByLName(var members) {
  var message='';
  message +='\nClassement par nom de famille\n';
  members.sort((a, b) => a['lastName'].compareTo(b['lastName']));

  for (var i in members) {
    message+='\n';
    message+= i.toString();
  }
return message;
}

findByLetter(var asso, var letter) {
  var message='';
  message +='\nRecherche de la lettre $letter\n';
  for (var i = 0; i < asso.length; i++) {
    for (var j = 0; j < asso[i]['members'].length; j++) {
      if (asso[i]['members'][j]['lastName'][0] == letter) {
        message+='Trouvé: ' + asso[i]['members'][j]['lastName']+ '\n';
      }
    }
  }
  return message;
}

class Member {
  String lastName;
  String firstName;
  String email;
  var memberships = [];

  Member(String firstName, String lastName, String email) {
    this.lastName = lastName;
    this.firstName = firstName;
    this.email = email;
  }

  String toString() {
    return '  {\n' '    MEMBRE\n' '    firstName: ${firstName}\n'
        '    lastName: ${lastName}\n' '    email: ${email}\n' '  }\n';
  }

  MembershipstoString() {
    var message='';
    for (var i = 0; i < memberships.length; i++) {
      message +=(memberships[i].toString());
    }
    return message;
  }

  addMembership(Association asso) {
    memberships.add(asso);
  }

  removeMembership(Association asso) {
    for (var i = 0; i < memberships.length; i++) {
      if (memberships[i].name == asso.name) {
        memberships.removeAt(i);
      }
    }
  }
}
class Association {
  String name;
  String description;
  var members = [];

  Association(String name, String description) {
    this.name = name;
    this.description = description;
  }

  String toString() {
    return '  {\n' '    ASSOCIATION\n' '    name: ${name}\n'
        '    description: ${description}\n' '  }\n';
  }

  MemberstoString() {
    var message='';
    for (var i = 0; i < members.length; i++) {
      message+=(members[i].toString());
    }
    return message;
  }

  addMember(Member memb) {
    members.add(memb);
    memb.addMembership(this);
  }

  removeMember(String email) {
    for (var i = 0; i < members.length; i++) {
      if (members[i].email == email) {
        members[i].removeMembership(this);
        members.removeAt(i);
      }
    }
  }

  updateMember(String email, String firstName, String lastName) {
    for (var i = 0; i < members.length; i++) {
      if (members[i].firstName == firstName &&
          members[i].lastName == lastName) {
        members[i].email = email;
      }
    }
  }

}

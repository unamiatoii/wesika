import 'package:flutter/material.dart';
import 'package:wesika/composants/Buttons.dart';
import 'package:wesika/models/Tontine.dart';
import 'package:wesika/models/Users.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Importez Cloud Firestore
import 'package:firebase_auth/firebase_auth.dart'; // Importez Firebase Auth

class NouvelleTontineWidget extends StatefulWidget {
  @override
  _NouvelleTontineWidgetState createState() => _NouvelleTontineWidgetState();
}

class _NouvelleTontineWidgetState extends State<NouvelleTontineWidget> {
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _participantsController = TextEditingController();
  final TextEditingController _montantAAtteindreController =
      TextEditingController();
  final TextEditingController _montantVerseController = TextEditingController();
  final TextEditingController _periodePaiementController =
      TextEditingController();
  final TextEditingController _periodeRetraitController =
      TextEditingController();
  final List<UserData> _participants = [];

  final List<UserData> _selectedParticipants = [];
  final TextEditingController _nbrparticipantsController =
      TextEditingController();
  final List<UserData> _searchResults = []; // Liste des résultats de recherche

  @override
  @override
  void initState() {
    super.initState();
    // Call an asynchronous function to initialize _searchResults
    _initializeSearchResults();
  }

  Future<void> _initializeSearchResults() async {
    // Initialize _searchResults with a list of users
    List<UserData> users = await getAllUsers();
    setState(() {
      _searchResults.addAll(users);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: _buildTextField(
                      'Nom de la tontine',
                      'Entrez le nom de la tontine',
                      Icons.ac_unit,
                      _nomController,
                    ),
                  ),
                  const SizedBox(width: 16), // Espace entre les deux champs
                  Expanded(
                    child: _buildTextField(
                      'Nombre de participants',
                      'Entrez le nombre de participants',
                      Icons.people,
                      _nbrparticipantsController,
                      TextInputType
                          .number, // Spécifiez le type de clavier comme TextInputType.number
                    ),
                  ),
                ],
              ),
              _buildTextField(
                'Montant à atteindre',
                'Entrez le montant à atteindre',
                Icons.monetization_on,
                _montantAAtteindreController,
                TextInputType
                    .number, // Spécifiez le type de clavier comme TextInputType.number
              ),
              _buildTextField(
                'Montant à verser',
                'Entrez le montant à verser',
                Icons.attach_money,
                _montantVerseController,
                TextInputType
                    .number, // Spécifiez le type de clavier comme TextInputType.number
              ),
              _buildTextField(
                'Période de paiement (en jours)',
                'Entrez la période de paiement en jours',
                Icons.schedule,
                _periodePaiementController,
                TextInputType
                    .number, // Spécifiez le type de clavier comme TextInputType.number
              ),
              _buildTextField(
                'Période de retrait (en jours)',
                'Entrez la période de retrait en jours',
                Icons.schedule,
                _periodeRetraitController,
                TextInputType
                    .number, // Spécifiez le type de clavier comme TextInputType.number
              ),
              const SizedBox(
                  height:
                      16), // Espace entre le dernier champ de texte et la liste des participants
              Container(
                  width: 400, // Définissez la largeur souhaitée
                  height: 170, // Définissez la hauteur souhaitée
                  padding: const EdgeInsets.all(
                      16), // Ajoutez un espacement intérieur
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SingleChildScrollView(
                    child: _buildParticipantsList(),
                  ) // Afficher la liste des participants
                  ),
              const SizedBox(height: 20),

              // Champ de recherche et résultats de recherche
              _buildSearchField(),

              const SizedBox(height: 20),

              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buttons(
                      context: context,
                      texte: "Ajouter participants",
                      onPressed: () {
                        // Code pour ajouter un participant à la liste _selectedParticipants
                        _addParticipantByEmailOrPhone(
                            _participantsController.text);
                      },
                      backcolor: Theme.of(context).colorScheme.secondary,
                      bordercolor: Theme.of(context).colorScheme.onPrimary),
                  buttons(
                      context: context,
                      texte: "Créer",
                      onPressed: () {
                        // Code pour créer la tontine
                        createTontine();
                      },
                      backcolor: Theme.of(context).colorScheme.secondary,
                      bordercolor: Theme.of(context).colorScheme.onPrimary)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String hintText, IconData icon,
      TextEditingController controller,
      [TextInputType? textInputType]) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          hintText: hintText,
          prefixIcon: Icon(
            icon,
            color: Theme.of(context).colorScheme.secondary,
          ),
          labelStyle: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ),
        keyboardType: textInputType ?? TextInputType.text,
      ),
    );
  }

  Widget _buildParticipantsList() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: _selectedParticipants.length,
      itemBuilder: (context, index) {
        return Container(
          color: Theme.of(context)
              .colorScheme
              .onPrimary, // Background color en onPrimary
          child: ListTile(
            title: Text(
              "${_selectedParticipants[index].nom!} ${_selectedParticipants[index].prenom!}",
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.delete,
                color: Theme.of(context).colorScheme.secondary,
              ),
              onPressed: () {
                setState(() {
                  _selectedParticipants.removeAt(index);
                });
              },
            ),
          ),
        );
      },
    );
  }

  Widget _buildSearchField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: _participantsController,
        onChanged: _onSearchTextChanged, // Appelé lorsque le texte change
        decoration: InputDecoration(
          labelText: 'Rechercher un participant',
          prefixIcon: Icon(
            Icons.search,
            color: Theme.of(context).colorScheme.secondary,
          ),
          labelStyle: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSearchResults() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: _searchResults.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(_searchResults[index].nom!),
          onTap: () {
            // Lorsque l'utilisateur sélectionne un résultat de recherche, ajoutez-le à la liste _selectedParticipants
            setState(() {
              _selectedParticipants.add(_searchResults[index]);
              _participantsController.clear();
              _searchResults.clear(); // Effacez les résultats de recherche
            });
          },
        );
      },
    );
  }

  // Fonction pour ajouter un participant par email ou numéro de téléphone
  void _addParticipantByEmailOrPhone(String emailOrPhone) {
    // Implémentez ici la recherche Firebase en fonction de l'email ou du numéro
    // Assurez-vous que vous avez configuré Firebase correctement dans votre projet
    // et que vous avez une collection "users" contenant les informations des utilisateurs.

    // Ici, vous devriez effectuer une recherche Firebase et ajouter le résultat à _selectedParticipants
    // en utilisant setState.

    // Exemple de recherche dans Firebase (c'est un exemple, vous devrez adapter votre code) :
    FirebaseFirestore.instance
        .collection("Utilisateur")
        .where("email", isEqualTo: emailOrPhone)
        .get()
        .then((querySnapshot) {
      if (querySnapshot.docs.isNotEmpty) {
        // Si un utilisateur correspond à l'email ou au numéro de téléphone, ajoutez-le à _selectedParticipants
        UserData userData = UserData.fromSnapshot(querySnapshot.docs[0]);
        setState(() {
          _selectedParticipants.add(userData);
          _participantsController.clear();
        });
      } else {
        // Aucun utilisateur trouvé
        print("Aucun utilisateur trouvé pour $emailOrPhone");
      }
    }).catchError((error) {
      print("Erreur lors de la recherche d'utilisateur : $error");
    });
  }

  // Fonction pour créer la tontine
  void createTontine() async {
    try {
      // Récupérez l'utilisateur actuellement connecté
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        // L'UID de l'utilisateur actuellement connecté
        String creatorId = user.uid;
        List<String?> participantIds =
            _selectedParticipants.map((user) => user.userID).toList();

        // Créez la Tontine avec l'UID de l'utilisateur connecté
        Tontine tontine = Tontine(
          participants: participantIds,
          periodeRetrait: num.tryParse(_periodeRetraitController.text) ?? 0,
          periodePaiement: num.tryParse(_periodePaiementController.text) ?? 0,
          montantRecolte: 0,
          nombreParticipants:
              num.tryParse(_nbrparticipantsController.text) ?? 0,
          nom: _nomController.text,
          montantAAtteindre:
              num.tryParse(_montantAAtteindreController.text) ?? 0.0,
          montantAVerser: num.tryParse(_montantVerseController.text) ?? 0.0,
        );

        // Créez la tontine en utilisant l'UID de l'utilisateur connecté
        await tontine.createTontine(creatorId);
      } else {
        print("Aucun utilisateur connecté.");
      }
    } catch (e) {
      print("Erreur lors de la création de la tontine : $e");
    }
  }

  // Fonction pour gérer la recherche
  void _onSearchTextChanged(String searchText) {
    _searchResults.clear(); // Effacez les résultats de recherche existants

    if (searchText.isEmpty) {
      // Si la recherche est vide, ne rien afficher
      setState(() {});
      return;
    }

    // Effectuez votre logique de recherche ici, par exemple, à partir d'une liste d'utilisateurs
    // Remplacez cette logique par votre propre logique de recherche
    final List<UserData> searchResults = _performSearch(searchText);

    // Mettez à jour la liste des résultats de recherche
    setState(() {
      _searchResults.addAll(searchResults);
    });
  }

  // Simulez la logique de recherche (remplacez par votre propre logique)
  List<UserData> _performSearch(String searchText) {
    // Vous pouvez implémenter votre propre logique de recherche ici
    // Pour cet exemple, nous simulons une recherche dans une liste fictive d'utilisateurs
    final List<UserData> allUsers = getAllUsers() as List<UserData>;
    return allUsers
        .where((user) =>
            user.email!.toLowerCase().contains(searchText.toLowerCase()))
        .toList();
  }
}

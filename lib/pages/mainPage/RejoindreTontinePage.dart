import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wesika/models/Tontine.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RejoindreTontinePage extends StatefulWidget {
  @override
  _RejoindreTontinePageState createState() => _RejoindreTontinePageState();
}

class _RejoindreTontinePageState extends State<RejoindreTontinePage> {
  final TextEditingController _searchController = TextEditingController();
  bool _isLoading = false;
  bool _hasJoined = false;
  List<Tontine> _searchResults = [];
  List<Tontine> _allTontines = [];

  @override
  void initState() {
    super.initState();
    _fetchAllTontines();
  }

  Widget _buildSearchField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: _searchController,
        onChanged: (query) {
          _searchTontines(query);
        },
        decoration: InputDecoration(
          labelText: 'Rechercher une tontine',
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

  Future<void> _fetchAllTontines() async {
    try {
      final QuerySnapshot tontinesSnapshot =
          await FirebaseFirestore.instance.collection("Tontine").get();

      final List<Tontine> allTontines = [];

      for (final doc in tontinesSnapshot.docs) {
        final data = doc.data() as Map<String, dynamic>;
        final tontine = Tontine(
          id: doc.id,
          nom: data['nom'],
          montantAAtteindre: data['montantAAtteindre'].toDouble(),
          montantRecolte: data['montantRecolte'].toDouble(),
          nombreParticipants: data['nombreParticipants'],
          montantAVerser: data['montantAVerser'].toDouble(),
          periodePaiement: data['periodePaiement'],
          periodeRetrait: data['periodeRetrait'],
          participants: List<String>.from(data['participants']),
        );
        allTontines.add(tontine);
      }

      setState(() {
        _allTontines = allTontines;
      });
    } catch (e) {
      print("Erreur lors du chargement des tontines : $e");
    }
  }

  Future<void> _searchTontines(String query) async {
    setState(() {
      _isLoading = true;
    });

    query = query.toLowerCase();

    try {
      final List<Tontine> results = [];

      for (final tontine in _allTontines) {
        final nomTontine = tontine.nom.toLowerCase();

        if (nomTontine.contains(query)) {
          results.add(tontine);
        }
      }

      setState(() {
        _searchResults = results;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _searchResults = [];
        _isLoading = false;
      });
      print("Erreur de recherche : $e");
    }
  }

  Future<void> _joinTontine(Tontine tontine) async {
    await FirebaseFirestore.instance
        .collection("Tontine")
        .doc(tontine.id)
        .update({
      'participants':
          FieldValue.arrayUnion([FirebaseAuth.instance.currentUser?.uid]),
    });

    setState(() {
      _hasJoined = true;
    });
  }

  Widget InfoTontineText(String data) {
    return Text(
      data,
      style: TextStyle(
        color: Colors.white, // Couleur du texte en blanc
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildSearchField(),
          _isLoading
              ? CircularProgressIndicator()
              : _hasJoined
                  ? Text(
                      'Vous avez déjà rejoint cette tontine.',
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    )
                  : Expanded(
                      child: ListView.builder(
                        itemCount: _searchResults.length,
                        itemBuilder: (context, index) {
                          final tontine = _searchResults[index];
                          return Padding(
                            padding: EdgeInsets.fromLTRB(0, 3, 0, 10),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimary, // Background color en onPrimary
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(
                                    12.0), // Espacement autour du ListTile
                                child: ListTile(
                                  title: Text(
                                    tontine.nom.toUpperCase(),
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary // Couleur du texte en blanc
                                        ),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      InfoTontineText(
                                        'Participants: ${tontine.nombreParticipants.toString()}',
                                      ),
                                      InfoTontineText(
                                        'Montant à verser: ${tontine.montantAVerser.toString()}',
                                      ),
                                      InfoTontineText(
                                        'Période de paiement: ${tontine.periodePaiement.toString()}',
                                      ),
                                      InfoTontineText(
                                        'Période de retrait: ${tontine.periodeRetrait.toString()}',
                                      )
                                    ],
                                  ),
                                  trailing: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          _joinTontine(tontine);
                                        },
                                        child: Text(
                                          'Rejoindre',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
        ],
      ),
    );
  }
}
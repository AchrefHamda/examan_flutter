import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, dynamic>? selectedCountry;

  final List<Map<String, dynamic>> countries = [
    {
      'Pays': 'Tunisie',
      'Capitale': 'Tunis',
      'Population': '12 Millions',
      'Langue': 'Arabe',
      'image': 'assets/images/tn.png',
    },
    {
      'Pays': 'Maroc',
      'Capitale': 'Rabat',
      'Population': '38 Millions',
      'Langue': 'Arabe',
      'image': 'assets/images/ma.png',
    },
    {
      'Pays': 'USA',
      'Capitale': 'Washington',
      'Population': '332 Millions',
      'Langue': 'Anglais',
      'image': 'assets/images/us.png',
    },
    {
      'Pays': 'France',
      'Capitale': 'Paris',
      'Population': '68 Millions',
      'Langue': 'Français',
      'image': 'assets/images/fr.png',
    },
    {
      'Pays': 'Brésil',
      'Capitale': 'Brasilia',
      'Population': '214 Millions',
      'Langue': 'Portugais',
      'image': 'assets/images/br.png',
    },
  ];

  void _selectCountry(Map<String, dynamic> country) {
    setState(() {
      selectedCountry = country;
    });
  }

  // Fonction qui sera appelée lorsque le bouton d'ajout est pressé
  void _addNewCountry() {
    // Cette fonction peut être personnalisée pour ajouter un pays à la liste.
    // Par exemple, on peut ouvrir un formulaire ou simplement ajouter un pays fictif.
    print("Ajouter un nouveau pays");
  }

  // Fonction pour revenir à la page d'accueil
  void _goToHomePage() {
    // Cette fonction peut être utilisée pour naviguer vers la page d'accueil.
    Navigator.pop(context); // Si vous êtes sur une page différente, cela reviendra à la page précédente
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informations sur les pays'),
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: _goToHomePage, // Utilisation de la fonction pour revenir à l'accueil
            tooltip: 'Retour à l\'accueil',
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Center(
                child: Text(
                  'Menu',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text(
                'A propos',
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 50),
          const Text(
            'Click sur un pays',
            style: TextStyle(
              color: Colors.black,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 40),
          Wrap(
            spacing: 20,
            alignment: WrapAlignment.center,
            children: countries.map((country) {
              return ElevatedButton(
                onPressed: () => _selectCountry(country),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  backgroundColor: Colors.blue,
                ),
                child: Text(country['Pays']),
              );
            }).toList(),
          ),
          const SizedBox(height: 80),
          if (selectedCountry != null) ...[
            Image.asset(
              selectedCountry!['image'],
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 10),
            Text(
              selectedCountry!['Pays'],
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('Capitale: ${selectedCountry!['Capitale']}'),
            Text('Population: ${selectedCountry!['Population']}'),
            Text('Langue: ${selectedCountry!['Langue']}'),
          ],
        ],
      ),
      // Ajout du bouton flottant d'ajout
      floatingActionButton: FloatingActionButton(
        onPressed: _addNewCountry,
        child: const Icon(Icons.add),
        backgroundColor: Colors.blue,
        tooltip: 'Ajouter un pays',
      ),
    );
  }
}

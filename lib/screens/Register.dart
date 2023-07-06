import 'package:bottlerecyclerapp/core/app_export.dart';
import 'package:bottlerecyclerapp/components/CustomButton.dart';
import 'package:bottlerecyclerapp/data/apiClient/api_client.dart' as api;

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final secureStorage = SecureStorage();

  final RegExp _emailRegExp =
      RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');
  final RegExp _phoneRegExp = RegExp(r'^[0-9]{10}$');

  bool _isSecret = true;
  bool _isSecret2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.backgroundApp,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              secureStorage.deleteSecureData('userData');
              Navigator.pushNamed(context, AppRoutes.authScreen);
            },
            icon: Icon(Icons.login),
          ),
        ],
        backgroundColor: Color.fromARGB(255, 71, 144, 14),
        title: Text('Bottle Recycler App'),
      ),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Bienvenue sur\n',
              style: TextStyle(
                color: Colors.green,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const Text(
              'Bottle Recycler App',
              style: TextStyle(
                color: Colors.green,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20.0),
            CustomImageView(
              imagePath: ImageConstant.imgImage1,
              height: getSize(
                150,
              ),
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Inscrivez-vous pour continuer\nc\'est gratuit',
              style: TextStyle(
                color: Color.fromARGB(255, 46, 176, 199),
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20.0),
            /**
             * ! ##########################################################
             * !            DÉBUT DU FORMULAIRE D'INSCRIPTION
             * ! ##########################################################
             */
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: _nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez saisir votre nom';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Nom *',
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 16.0),
                      // labelText: _labelText,
                      filled: true,
                      fillColor: Color.fromARGB(51, 75, 194, 80),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 100, 160, 20)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  TextFormField(
                    controller: _usernameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez saisir votre prénom';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Prénom *',
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 16.0),
                      // labelText: _labelText,
                      filled: true,
                      fillColor: Color.fromARGB(51, 75, 194, 80),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 100, 160, 20)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  TextFormField(
                    controller: _emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez saisir votre adresse email';
                      }
                      if (!_emailRegExp.hasMatch(value)) {
                        return 'Veuillez saisir une adresse email valide';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'E-mail *',
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 16.0),
                      // labelText: _labelText,
                      filled: true,
                      fillColor: Color.fromARGB(51, 75, 194, 80),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 100, 160, 20)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: _isSecret,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez saisir votre mot de passe';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Mot de passe *',
                      suffixIcon: InkWell(
                        onTap: () => setState(() => _isSecret = !_isSecret),
                        child: Icon(
                          !_isSecret ? Icons.visibility : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 16.0),
                      filled: true,
                      fillColor: const Color.fromARGB(51, 75, 194, 80),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 100, 160, 20)),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  TextFormField(
                    controller: _confirmPasswordController,
                    obscureText: _isSecret2,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez saisir à nouveau, votre mot de passe';
                      } else if (!value.isEmpty &&
                          !_passwordController.text.isEmpty) {
                        if (value != _passwordController.text) {
                          return 'Les mots de passe ne correspondent pas';
                        }
                        return null;
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Confirmation Mot de passe *',
                      suffixIcon: InkWell(
                        onTap: () => setState(() => _isSecret2 = !_isSecret2),
                        child: Icon(
                          !_isSecret2 ? Icons.visibility : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 16.0),
                      filled: true,
                      fillColor: const Color.fromARGB(51, 75, 194, 80),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 100, 160, 20)),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  TextFormField(
                    controller: _phoneController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        _phoneController.text = '0123456789';
                        return null;
                      }
                      if (value.isNotEmpty && !_phoneRegExp.hasMatch(value) ||
                          value != 'non renseigné') {
                        return 'Veuillez saisir un numéro de téléphone valide';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Téléphone (facultatif)',
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 16.0),
                      // labelText: _labelText,
                      filled: true,
                      fillColor: Color.fromARGB(51, 75, 194, 80),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 100, 160, 20)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  CustomButton.secondary(
                    text: 'S\'inscrire',
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        var name = _nameController.text;
                        var username = _usernameController.text;
                        var email = _emailController.text;
                        var password = _passwordController.text;
                        var phone = _phoneController.text;

                        if (!name.isEmpty &&
                            !username.isEmpty &&
                            !email.isEmpty &&
                            !password.isEmpty &&
                            !phone.isEmpty) {
                          // ! Vérification si l'utilisateur existe déjà:
                          var userExiste = await api.userData(email);
                          print(
                              'user data: ' + userExiste['status'].toString());
                          // ! Si l'utilisateur existe déjà:
                          if (userExiste['status'] == 'success') {
                            print('l\'user existe deja');
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    'Un compte existe déjà avec cette adresse email'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                          // ! Si l'utilisateur n'existe pas:
                          else {
                            print('l\'user n\'existe pas');
                            // ! Enregistrement de l'utilisateur en BDD:
                            var userRegister = await api.userRegister(
                                name, username, email, password, phone);
                            print("l\'user enregister BDD: $userRegister");
                            // ! Si l'enregistrement est un succès:
                            if (userRegister['status'] == 'success') {
                              var userData = userRegister['data'];
                              print("enregistrer avec success : $userData");
                              secureStorage.writeSecureData(
                                  'userData', userData);
                              print("bla bla bla");
                              print(secureStorage
                                  .readSecureData('userData')
                                  .toString());
                            }
                          }
                          Navigator.pushNamed(
                              context, AppRoutes.profilUserScreen);
                        }
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

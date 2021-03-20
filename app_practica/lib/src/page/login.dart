import 'package:app_practica/src/model/usuario_model.dart';
import 'package:app_practica/src/provider/usuario_provider.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  /*
   * PROPIEDADES FORMULARIO
   */
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(50.0),
  );
  final _usuarioProvider = new UsuarioProvider();
  String email;
  String pass;

  bool _guardando = false;
  bool _obscureText = true;
  UsuarioModel dataModel = new UsuarioModel();

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    dataModel.username = 'jmorente';
    dataModel.pass = '12345';
    return Scaffold(
      key: scaffoldKey,
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/img/image.png"),
                fit: BoxFit.cover,
                alignment: AlignmentDirectional.bottomCenter),
          ),
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Text(""),
            ),
            backgroundColor: Color.fromRGBO(0, 0, 0, 0.3),
            //drawer: MenuUsuarioWidget(),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: _size.height * 0.25),
                // Gallery
                Expanded(
                    child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 15.0),
                  decoration: BoxDecoration(
                    color: Color(0xffEFEFEF),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(34),
                    ),
                  ),
                  child: Form(
                    key: formKey,
                    child: ListView(
                      padding: EdgeInsets.all(15.0),
                      children: <Widget>[
                        Container(
                          child: Center(
                            child: Image.asset(
                              'assets/img/usac.png',
                              width: _size.width * 0.3,
                              height: _size.width * 0.3,
                              alignment: Alignment.center,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        _correo(),
                        SizedBox(
                          height: 15.0,
                        ),
                        _passwordField(),
                        SizedBox(
                          height: 15.0,
                        ),
                        _crearBoton(),
                        SizedBox(
                          height: 15.0,
                        ),
                        _crearCuenta(),
                        SizedBox(
                          height: 30.0,
                        ),
                      ],
                    ),
                  ),
                ))
              ],
            ),
          )),
    );
  }

  /*
   * VISUALIZAR CONTRASENA
   */
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  /*
   * INPUT CORREO
   */
  Widget _correo() {
    return TextFormField(
      initialValue: dataModel.username,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          hintText: 'Nombre de Usuario',
          labelText: 'Nombre de Usuario',
          focusedErrorBorder: _outlineInputBorder,
          errorBorder: _outlineInputBorder,
          focusedBorder: _outlineInputBorder,
          enabledBorder: _outlineInputBorder,
          suffixIcon: Icon(Icons.alternate_email)),
      onSaved: (value) => dataModel.username = value,
      validator: (value) {
        if (value.length < 1) {
          return 'El nombre de usuario es requerido.';
        } else {
          return null;
        }
      },
    );
  }

  /*
   * INPUT CONTRASENA
   */
  Widget _passwordField() {
    return TextFormField(
      initialValue: dataModel.pass,
      obscureText: _obscureText,
      decoration: InputDecoration(
          hintText: 'Contraseña',
          labelText: 'Contraseña',
          focusedErrorBorder: _outlineInputBorder,
          errorBorder: _outlineInputBorder,
          focusedBorder: _outlineInputBorder,
          enabledBorder: _outlineInputBorder,
          suffixIcon: IconButton(
              onPressed: _toggle,
              icon: Icon(_obscureText ? Icons.lock_outline : Icons.lock_open))),
      onSaved: (value) => dataModel.pass = value,
      validator: (value) {
        if (value.length < 1) {
          return 'La contraseña es requerida.';
        } else {
          return null;
        }
      },
    );
  }

  /*
   * WIDGET BOTON INICIO
   */
  Widget _crearBoton() {
    return ButtonTheme(
      minWidth: double.infinity,
      height: 50.0,
      child: RaisedButton.icon(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        color: Colors.blueAccent,
        textColor: Colors.white,
        label: Text('Iniciar Sesión'.toUpperCase()),
        icon: Icon(Icons.lock_open),
        onPressed: (_guardando) ? null : _submit,
      ),
    );
  }

  /*
   * WIDGET BOTON NUEVA CUENTA
   */
  Widget _crearCuenta() {
    return ButtonTheme(
      minWidth: double.infinity,
      height: 50.0,
      child: RaisedButton.icon(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        color: Colors.blueAccent,
        textColor: Colors.white,
        label: Text('Crear una nueva cuenta'.toUpperCase()),
        icon: Icon(Icons.person_add),
        onPressed: () {
          Navigator.pushNamed(context, 'register');
        },
      ),
    );
  }

  /*
   * WIDGET BOTON SUBMIT
   */
  void _submit() async {
    // Navigator.pushReplacementNamed(context, 'bluetooth');
    if (!formKey.currentState.validate()) return;

    formKey.currentState.save();

    setState(() {
      _guardando = true;
    });

    UsuarioModel usuarioModel = await _usuarioProvider.login(dataModel);
    if (usuarioModel != null) {
      Navigator.pushReplacementNamed(context, 'bluetooth');
      //   //ADMINISTRADOR
      //   if (usuarioModel.tipoId == 1) {
      //     Navigator.pushReplacementNamed(context, 'admin');
      //   }
      //   //USUARIO
      //   else {
      //     Navigator.pushReplacementNamed(context, 'admin');
      //   }
    } else {
      setState(() {
        _guardando = false;
      });
      SnackBar snackBar =
          new SnackBar(content: new Text("Usuario o contraseña inválidos."));
      scaffoldKey.currentState.showSnackBar(snackBar);
    }
  }
}

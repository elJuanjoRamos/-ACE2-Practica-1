import 'package:app_practica/src/model/usuario_model.dart';
import 'package:app_practica/src/provider/usuario_provider.dart';
import 'package:app_practica/src/widgets/alert_widget.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  /*
   * PROPIEDADES FORMULARIO
   */
  final formKey = GlobalKey<FormState>();
  final _outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(50.0),
  );
  bool _obscureText = true;
  bool _guardando = false;
  String nombre;

  UsuarioModel dataModel = new UsuarioModel();

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Container(
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
            title:
                Text('Registrar Cuenta', style: TextStyle(color: Colors.white)),
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
                      _nombre(),
                      SizedBox(
                        height: 15.0,
                      ),
                      _apellido(),
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
                      _edad(),
                      SizedBox(
                        height: 15.0,
                      ),
                      _peso(),
                      SizedBox(
                        height: 15.0,
                      ),
                      _estatura(),
                      SizedBox(
                        height: 15.0,
                      ),
                      _crearDropdownSexo(),
                      SizedBox(
                        height: 15.0,
                      ),
                      _crearDropdownTipo(),
                      SizedBox(
                        height: 15.0,
                      ),
                      _crearBoton(),
                      SizedBox(
                        height: 30.0,
                      ),
                    ],
                  ),
                ),
              ))
            ],
          ),
        ));
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
   * INPUT NOMBRE
   */
  Widget _nombre() {
    return TextFormField(
      initialValue: dataModel.nombres,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          hintText: 'Nombre',
          labelText: 'Nombre',
          focusedErrorBorder: _outlineInputBorder,
          errorBorder: _outlineInputBorder,
          focusedBorder: _outlineInputBorder,
          enabledBorder: _outlineInputBorder,
          suffixIcon: Icon(Icons.person_outline)),
      onSaved: (value) => dataModel.nombres = value,
      validator: (value) {
        if (value.length < 1) {
          return 'El nombre es requerido.';
        } else {
          return null;
        }
      },
    );
  }

  /*
   * INPUT NOMBRE
   */
  Widget _apellido() {
    return TextFormField(
      initialValue: dataModel.apellidos,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          hintText: 'Apellido',
          labelText: 'Apellido',
          focusedErrorBorder: _outlineInputBorder,
          errorBorder: _outlineInputBorder,
          focusedBorder: _outlineInputBorder,
          enabledBorder: _outlineInputBorder,
          suffixIcon: Icon(Icons.person_outline)),
      onSaved: (value) => dataModel.apellidos = value,
      validator: (value) {
        if (value.length < 1) {
          return 'El apellido es requerido.';
        } else {
          return null;
        }
      },
    );
  }

  /*
   * INPUT CORREO
   */
  Widget _correo() {
    return TextFormField(
      initialValue: dataModel.username,
      keyboardType: TextInputType.text,
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
   * INPUT PASSWORD
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
   * INPUT EDAD
   */
  Widget _edad() {
    return TextFormField(
      initialValue: nombre,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          hintText: 'Edad',
          labelText: 'Edad',
          focusedErrorBorder: _outlineInputBorder,
          errorBorder: _outlineInputBorder,
          focusedBorder: _outlineInputBorder,
          enabledBorder: _outlineInputBorder,
          suffixIcon: Icon(Icons.phone_android)),
      onSaved: (value) => nombre = value,
      validator: (value) {
        if (value.length < 1) {
          return 'La edad es requerida.';
        } else {
          return null;
        }
      },
    );
  }

  /*
   * INPUT PESO
   */
  Widget _peso() {
    return TextFormField(
      initialValue: dataModel.peso.toString(),
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          hintText: 'Peso',
          labelText: 'Peso',
          focusedErrorBorder: _outlineInputBorder,
          errorBorder: _outlineInputBorder,
          focusedBorder: _outlineInputBorder,
          enabledBorder: _outlineInputBorder,
          suffixIcon: Icon(Icons.person)),
      onSaved: (value) => dataModel.peso = double.parse(value),
      validator: (value) {
        if (value.length < 1) {
          return 'El peso es requerida.';
        } else {
          return null;
        }
      },
    );
  }

  /*
   * INPUT NUMERO
   */
  Widget _estatura() {
    return TextFormField(
      initialValue: dataModel.estatura.toString(),
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          hintText: 'Estatura',
          labelText: 'Estatura',
          focusedErrorBorder: _outlineInputBorder,
          errorBorder: _outlineInputBorder,
          focusedBorder: _outlineInputBorder,
          enabledBorder: _outlineInputBorder,
          suffixIcon: Icon(Icons.people)),
      onSaved: (value) => dataModel.estatura = double.parse(value),
      validator: (value) {
        if (value.length < 1) {
          return 'La estatura es requerida.';
        } else {
          return null;
        }
      },
    );
  }

  /*
   * WIDGET DROPDOWN
   */
  Widget _crearDropdownSexo() {
    return FormField<String>(
      builder: (FormFieldState<String> state) {
        return InputDecorator(
          decoration: InputDecoration(
            hintText: 'Sexo ',
            labelText: 'Sexo ',
            focusedErrorBorder: _outlineInputBorder,
            errorBorder: _outlineInputBorder,
            focusedBorder: _outlineInputBorder,
            enabledBorder: _outlineInputBorder,
          ),
          child: DropdownButtonHideUnderline(
              child: DropdownButton(
                  value: dataModel.sexo,
                  items: [
                    DropdownMenuItem(
                      child: Text("Masculino"),
                      value: 'M',
                    ),
                    DropdownMenuItem(
                      child: Text("Femenino"),
                      value: 'F',
                    )
                  ],
                  onChanged: (value) {
                    setState(() {
                      dataModel.sexo = value;
                    });
                  })),
        );
      },
    );
  }

  /*
   * WIDGET DROPDOWN
   */
  Widget _crearDropdownTipo() {
    return FormField<int>(
      builder: (FormFieldState<int> state) {
        return InputDecorator(
          decoration: InputDecoration(
            hintText: 'Tipo Usuario ',
            labelText: 'Tipo Usuario ',
            focusedErrorBorder: _outlineInputBorder,
            errorBorder: _outlineInputBorder,
            focusedBorder: _outlineInputBorder,
            enabledBorder: _outlineInputBorder,
          ),
          child: DropdownButtonHideUnderline(
              child: DropdownButton(
                  value: dataModel.tipo,
                  items: [
                    DropdownMenuItem(
                      child: Text("Atleta"),
                      value: 1,
                    ),
                    DropdownMenuItem(
                      child: Text("Coach"),
                      value: 2,
                    )
                  ],
                  onChanged: (value) {
                    setState(() {
                      dataModel.tipo = value;
                    });
                  })),
        );
      },
    );
  }

  /*
   * WIDGET BOTON
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
        label: Text('Registrar Cuenta'.toUpperCase()),
        icon: Icon(Icons.lock_open),
        onPressed: (_guardando) ? null : _submit,
      ),
    );
  }

  void _submit() async {
    if (!formKey.currentState.validate()) return;
    // dataModel.tipoId = 2;
    // dataModel.estado = 1;
    // dataModel.fechaNac = DateTime.now().toIso8601String().split('T')[0];
    // dataModel.fecha = DateTime.now().toIso8601String().split('T')[0];
    // dataModel.hora = DateTime.now().toIso8601String().split('T')[1];
    // dataModel.img =
    //     'https://res.cloudinary.com/dksstmpfu/image/upload/v1609965264/test/categoria/sldl1o85ruzeockszmth.jpg';
    formKey.currentState.save();

    setState(() {
      _guardando = true;
    });

    if (dataModel.id == null) {
      UsuarioProvider usuarioProvider = new UsuarioProvider();
      usuarioProvider.create(dataModel);
    }

    Navigator.pop(context);
    mostrarAlert(context, "Usuario Registrado",
        "Inicia sesión con tu usuario : ${dataModel.username}");
  }
}

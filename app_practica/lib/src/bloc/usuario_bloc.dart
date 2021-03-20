import 'package:app_practica/src/model/usuario_model.dart';
import 'package:app_practica/src/provider/usuario_provider.dart';
import 'package:rxdart/rxdart.dart';

class UsuarioBloc {
  //==================================================
  //                    PROPIEDADES
  //==================================================
  // BEHAVIOR SUBJECT
  final _dataController = new BehaviorSubject<List<UsuarioModel>>();
  final _cargandoController = new BehaviorSubject<bool>();

  // PROVIDER
  final _dataProvider = new UsuarioProvider();

  // STREAM
  Stream<List<UsuarioModel>> get dataStream => _dataController.stream;
  Stream<bool> get cargando => _cargandoController.stream;

  //==================================================
  //                     GET ALL
  //==================================================
  void getAll() async {
    _dataController.sink.add(null);
    final data = await _dataProvider.getAll();
    _dataController.sink.add(data);
  }

  //==================================================
  //                     GET ALL
  //==================================================
  void getAllCoach() async {
    _dataController.sink.add(null);
    final data = await _dataProvider.getAllCoach();
    _dataController.sink.add(data);
  }

  //==================================================
  //                     CREATE
  //==================================================
  void create(UsuarioModel dataModel) async {
    _cargandoController.sink.add(true);
    await _dataProvider.create(dataModel);
    _cargandoController.sink.add(false);
  }

  //==================================================
  //                     UPDATE
  //==================================================
  void update(UsuarioModel dataModel) async {
    _cargandoController.sink.add(true);
    await _dataProvider.update(dataModel);
    _cargandoController.sink.add(false);
  }

  //==================================================
  //                     DELETE
  //==================================================
  void delete(String id) async {
    await _dataProvider.delete(id);
  }

  //==================================================
  //                     DISPOSE
  //==================================================
  dispose() {
    _dataController?.close();
    _cargandoController?.close();
  }
}

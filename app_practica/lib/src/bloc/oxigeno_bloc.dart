import 'package:app_practica/src/model/oxigeno_model.dart';
import 'package:app_practica/src/provider/oxigeno_provider.dart';
import 'package:rxdart/rxdart.dart';

class OxigenoBloc {
  //==================================================
  //                    PROPIEDADES
  //==================================================
  // BEHAVIOR SUBJECT
  final _dataController = new BehaviorSubject<List<OxigenoModel>>();
  final _cargandoController = new BehaviorSubject<bool>();

  // PROVIDER
  final _dataProvider = new OxigenoProvider();

  // STREAM
  Stream<List<OxigenoModel>> get dataStream => _dataController.stream;
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
  //                     CREATE
  //==================================================
  void create(OxigenoModel dataModel) async {
    _cargandoController.sink.add(true);
    await _dataProvider.create(dataModel);
    _cargandoController.sink.add(false);
  }

  //==================================================
  //                     UPDATE
  //==================================================
  void update(OxigenoModel dataModel) async {
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

import 'package:app_practica/src/model/frecuencia_model.dart';
import 'package:app_practica/src/provider/frecuencia_provider.dart';
import 'package:rxdart/rxdart.dart';

class FrecuenciaBloc {
  //==================================================
  //                    PROPIEDADES
  //==================================================
  // BEHAVIOR SUBJECT
  final _dataController = new BehaviorSubject<List<FrecuenciaModel>>();
  final _cargandoController = new BehaviorSubject<bool>();

  // PROVIDER
  final _dataProvider = new FrecuenciaProvider();

  // STREAM
  Stream<List<FrecuenciaModel>> get dataStream => _dataController.stream;
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
  void create(FrecuenciaModel dataModel) async {
    _cargandoController.sink.add(true);
    await _dataProvider.create(dataModel);
    _cargandoController.sink.add(false);
  }

  //==================================================
  //                     UPDATE
  //==================================================
  void update(FrecuenciaModel dataModel) async {
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

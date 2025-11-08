import 'package:organizador_repertorios/features/repertory/domain/entities/repertory.dart';

abstract class IRepertoryRepo {
  
  Future<void> createRepertory(String name);
  Future<void> deleteRepertory(int id);
  Future<void> renameRepertory(int id, String name);
  void fetchAll();
  Stream<List<Repertory>> watchAll();
}
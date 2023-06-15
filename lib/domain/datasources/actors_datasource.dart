import 'package:verifarma_cine_app/domain/entities/actor.dart';

abstract class ActorsDatasource {

  Future<List<Actor>> getActorsByMovie( String movieId );

}
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:pokemon_app/infrastructure/architecture/cubits/messager/messenger_cubit.dart';
import 'package:pokemon_app/modules/domain/models/pokemon_detail/pokemon_detail_wrapper_model.dart';
import 'package:pokemon_app/modules/domain/usecases/get_pokemon_detail.dart';

part 'pokemon_detail_state.dart';

@injectable
class PokemonDetailCubit extends Cubit<PokemonDetailState> {
  PokemonDetailCubit(this._getPokemonDetail, this._messengerCubit)
      : super(PokemonDetailInitial());
  final GetPokemonDetail _getPokemonDetail;
  final MessengerCubit _messengerCubit;

  void getPokemonDetail(int id) async {
    emit(PokemonDetailLoading());
    final usecaseCall = await _getPokemonDetail(GetPokemonDetailParams(id));
    usecaseCall.when(
      success: (data) => emit(PokemonDetailLoaded(pokemon: data)),
      error: (exception) {
        emit(PokemonDetailFailed(message: exception.message));
        _messengerCubit.showErrorSnackbar(exception.message);
      },
    );
  }
}

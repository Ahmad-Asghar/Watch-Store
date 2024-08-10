import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/watch_bloc.dart';
import '../blocs/watch_state.dart';


class BackStackWidget extends StatelessWidget {
  const BackStackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WatchBloc, WatchState>(
        builder: (context, state) {
      if (state is WatchLoaded) {
        return Stack(
          children: <Widget>[
            Stack(
              children: [
                Image(image: const AssetImage('assets/images/png/cornor.png'),height: 210,color: state.watches[state.currentIndex].color),
                const Image(image: AssetImage('assets/images/png/cornor.png'),height: 70,color: Colors.black,),
              ],
            ),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 70.0, sigmaY: 70.0),
                child: Container(
                  color: Colors.black.withOpacity(0),
                ),
              ),
            ),
          ],
        );
      }else{
        return const SizedBox();
      }
      }
    );
  }
}

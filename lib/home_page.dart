import 'dart:io';

import 'package:camera_app/bloc/camera_bloc.dart';
import 'package:camera_app/bloc/camera_event.dart';
import 'package:camera_app/bloc/camera_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Beranda'),),
      body: SafeArea(
        child: BlocConsumer<CameraBloc, CameraState>(
          listener: (context, state){
            if (state is CameraReady && state.snackbarMessage != null){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.snackbarMessage!)),
              );
              context.read<CameraBloc>().add(ClearSnackbar());
            }
          },
          builder: (context, state){
            final File? imageFile =
              state is CameraReady ? state.imageFile : null;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.camera),
                        label: const Text('Ambil Foto'),
                        onPressed: (){
                          final bloc = context.read<CameraBloc>();
                          if (bloc.state is! CameraReady){
                            bloc.add(InitializeCamera());
                          }
                          bloc.add(OpenCameraAndCapture(context));
                        }, 
                      )
                    )
                  ],
                )
              ],
            );
          },
        )
      ),
    );
  }
}
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vision_app/ui/bloc/cubit/tfmodel_cubit.dart';
import 'package:vision_app/ui/widgets/appBar.dart';
import 'package:vision_app/ui/widgets/theme/images.dart';
import 'package:vision_app/ui/widgets/theme/style.dart';

class MascotasPage extends StatefulWidget {
  MascotasPage({Key? key}) : super(key: key);

  @override
  _MascotasPageState createState() => _MascotasPageState();
}

class _MascotasPageState extends State<MascotasPage> {
  final ImagePicker _picker = ImagePicker();
  XFile? image;

  @override
  void initState() {
    BlocProvider.of<TfmodelCubit>(context).emit(TfmodelInitial());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(context, 'Mascotas', 'home', 'page3'),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(bottom: 100, top: 100),
        child:
            BlocBuilder<TfmodelCubit, TfmodelState>(builder: (context, state) {
          if (state is TfmodelLoading) {
            return CircularProgressIndicator();
          }
          if (state is TfmodelLoaded) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: FileImage(File(image!.path)),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                textResult(state.label),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.deepOrange[300])),
                  onPressed: () {
                    _showPicker(context);
                  },
                  child: Text('Tomar foto'),
                ),
              ],
            );
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(assetInfoDog),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              textSuggestion(),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.deepOrange[300])),
                onPressed: () {
                  _showPicker(context);
                },
                child: Text('Tomar foto'),
              ),
            ],
          );
        }),
      ),
    );
  }

  Column textSuggestion() {
    return Column(
      children: [
        Text(
          'Importa una imagen de tu mascota',
          style: textStyleOpenSans,
          textAlign: TextAlign.center,
        ),
        Text(
          'para poder identificarla por medio de inteligencia artificial',
          style: textStyleOpenSans,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  void _showPicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Galeria'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camara'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  _imgFromCamera() async {
    final XFile? selectImage =
        await _picker.pickImage(source: ImageSource.camera);
    if (selectImage != null) {
      print('Camara');
      print(selectImage);
      setState(() {
        image = selectImage;
      });
      await BlocProvider.of<TfmodelCubit>(context)
          .runMascotModel(File(selectImage.path));

      //TODO: Guardar imagen en la base de datos
    }
  }

  _imgFromGallery() async {
    final XFile? selectImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (selectImage != null) {
      setState(() {
        this.image = selectImage;
      });
      await BlocProvider.of<TfmodelCubit>(context)
          .runMascotModel(File(selectImage.path));

      //TODO: Guardar imagen en la base de datos
    }
  }

  textResult(String mascota) {
    return Column(
      children: [
        Text(
          'Tu mascota es un:',
          style: textStyleOpenSans,
          textAlign: TextAlign.center,
        ),
        Text(
          '$mascota',
          style: textStyleOpenSans,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

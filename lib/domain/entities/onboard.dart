import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnboardModel {
  String img;
  String text;
  String desc;
  Color bg;
  Color button;

  OnboardModel({
    required this.img,
    required this.text,
    required this.desc,
    required this.bg,
    required this.button,
  });
}

final List<OnboardModel> ListScreens = <OnboardModel>[
  OnboardModel(
    img: 'assets/img-4.png',
    text: "Sistema de detección de animales.",
    desc:
        "Este es un sistema de inteligencia artificial elaborado con la herramienta TensorFlow que nos sirve para el entrenamiento de una AI mediante un banco imágenes.",
    bg: Colors.white,
    button: Color(0xFF4756DF),
  ),
  OnboardModel(
    img: 'assets/img-5.png',
    text: "Sistema de detección de plantas",
    desc:
        "Este es un sistema de inteligencia artificial elaborado con la herramienta TensorFlow que nos sirve para el entrenamiento de una AI mediante un banco imágenes.",
    bg: Color(0xFF4756DF),
    button: Colors.white,
  ),
  OnboardModel(
    img: 'assets/img-3.png',
    text: "Sistema de generación de objetos 3D",
    desc:
        "Sistema que se genera con la tecnología Arcore que nos ayuda a poder generar objetos en 3 dimensiones en un plano con la ayuda de la cámara.",
    bg: Colors.white,
    button: Color(0xFF4756DF),
  ),
];

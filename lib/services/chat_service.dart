import 'package:chat/globals/environment.dart';
import 'package:chat/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:chat/models/usuario.dart';

import 'mensajes_response.dart';

class ChatService with ChangeNotifier {
  Usuario usuarioPara;

  Future<List<Mensaje>> getChat(String usuarioID) async {
    final uri = Uri.parse('${Environment.apiUrl}/mensajes/$usuarioID');

    final resp = await http.get(uri, headers: {
      'Content-Type': 'application/json',
      'x-token': await AuthService.getToken()
    });

    final mensajesResp = mensajesResponseFromJson(resp.body);

    return mensajesResp.mensajes;
  }
}

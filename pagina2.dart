// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

class Pagina2 extends StatefulWidget {
  const Pagina2({super.key});

  @override
  State<Pagina2> createState() => _Pagina2State();
}

class _Pagina2State extends State<Pagina2> {
  String _nomeTemp = '';
  String _notaTemp = '';
  String _resultado = '';

  void _calculamedia() {
    var nota = double.tryParse(_notaTemp);
    setState(() {
      if (nota != null) {
        if (nota >= 6) {
          _resultado = "$_nomeTemp, você passou !!!";
        } else {
          _resultado = "$_nomeTemp, você reprovou !!!";
        }
      } else {
        _resultado = "$_nomeTemp, digite um valor válido !!!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Resultado final:',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                children: [
                  const Text('Nome:',
                      style: TextStyle(fontSize: 16, color: Colors.deepPurple)),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        _nomeTemp = value;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Row(
                children: [
                  const Text('Nota:',
                      style: TextStyle(fontSize: 16, color: Colors.deepPurple)),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        _notaTemp = value;
                      },
                      decoration: const InputDecoration(
                        border:
                            OutlineInputBorder(), // Adiciona borda ao campo de texto
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: _calculamedia,
                child: const Text(
                  'Resultado',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurple,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              _resultado,
              style: const TextStyle(fontSize: 18, color: Colors.deepPurple),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:app_criptomeadas/repositories/favoritas_repository.dart';
import 'package:app_criptomeadas/repositories/moedas_repository.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../models/moedas.dart';
import '../pages/moedas_detalhes_page.dart';

class MoedasPage extends StatefulWidget {
  const MoedasPage({super.key});

  @override
  State<MoedasPage> createState() => _MoedasPageState();
}

class _MoedasPageState extends State<MoedasPage> {
  final tabela = MoedaRepository.tabela;
  List<Moeda> moedasSelecionadas = [];
  late FavoritasRepository favoritas;

  appBarDinamica() {
    if (moedasSelecionadas.isEmpty) {
      return AppBar(
          centerTitle: true,
          title: const Text(
            'Cripto Moedas',
            style: TextStyle(
              color: Colors.white,
            ),
          ));
    } else {
      return AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            setState(() {
              moedasSelecionadas = [];
            });
          },
        ),
        title: Text('${moedasSelecionadas.length} selecionadas'),
        backgroundColor: Colors.blueGrey[50],
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black87),
        titleTextStyle: const TextStyle(
          color: Colors.black87,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      );
    }
  }

  mostrarDetalhes(Moeda moeda) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => MoedasDetalhesPage(moeda: moeda),
      ),
    );
  }

  limparSelecionadas() {
    setState(() {
      moedasSelecionadas = [];
    });
  }

  NumberFormat real = NumberFormat.currency(locale: 'pt_BR', name: 'R\$');

  @override
  Widget build(BuildContext context) {
    favoritas = Provider.of<FavoritasRepository>(context);

    return Scaffold(
      appBar: appBarDinamica(),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int moeda) {
          return ListTile(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            leading: (moedasSelecionadas.contains(tabela[moeda]))
                ? const CircleAvatar(
                    child: Icon(Icons.check),
                  )
                : SizedBox(
                    width: 40,
                    child: Image.asset(tabela[moeda].icone),
                  ),
            title: Row(
              children: [
                Text(
                  tabela[moeda].nome,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                 if(favoritas.lista.contains(tabela[moeda]))  
                 const Icon(Icons.circle, color: Colors.amber, size: 8) 
              ],
            ),
            trailing: Text(
              real.format(
                tabela[moeda].preco,
              ),
            ),
            selected: moedasSelecionadas.contains(
              tabela[moeda],
            ),
            selectedTileColor: Colors.indigo[50],
            onLongPress: () {
              //? Verifica se as moedas selecionadas estão dentro da List
              setState(() {
                (moedasSelecionadas.contains(tabela[moeda]))
                    ? moedasSelecionadas.remove(tabela[moeda])
                    : moedasSelecionadas.add(tabela[moeda]);
              });
            },
            //? Ao clicar aqui entra em outra tela
            onTap: () => mostrarDetalhes(tabela[moeda]),
          );
        },
        padding: const EdgeInsets.all(16),
        separatorBuilder: (_, __) => const Divider(),
        itemCount: tabela.length,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: moedasSelecionadas.isEmpty
          ? null
          : FloatingActionButton.extended(
              icon: const Icon(Icons.star),
              onPressed: () {
                favoritas.salveAll(moedasSelecionadas);
                limparSelecionadas;
              },
              label: const Text(
                'FAVORITAR',
                style: TextStyle(letterSpacing: 0, fontWeight: FontWeight.bold),
              ),
            ),
    );
  }
}

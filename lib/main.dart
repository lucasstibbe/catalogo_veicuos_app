import 'package:flutter/material.dart';

void main() {
  runApp(const CatalogoVeiculosApp());
}

class Veiculo {
  final String marca;
  final String modelo;
  final int ano;
  double preco;

  Veiculo({
    required this.marca,
    required this.modelo,
    required this.ano,
    required this.preco,
  });

  String descricao() {
    return '$marca $modelo, ano $ano, por R\$ $preco';
  }
}

final List<Veiculo> veiculos = [
  Veiculo(
    marca: 'Toyota',
    modelo: 'Corolla',
    ano: 2024,
    preco: 150000,
  ),
  Veiculo(
    marca: 'Honda',
    modelo: 'Civic',
    ano: 2023,
    preco: 145000,
  ),
  Veiculo(
    marca: 'Volkswagen',
    modelo: 'T-Cross',
    ano: 2025,
    preco: 135000,
  ),
  Veiculo(
    marca: 'Chevrolet',
    modelo: 'Onix',
    ano: 2022,
    preco: 85000,
  ),
  Veiculo(
    marca: 'Ford',
    modelo: 'Ranger',
    ano: 2024,
    preco: 220000,
  ),
  Veiculo(
    marca: 'Hyundai',
    modelo: 'HB20',
    ano: 2023,
    preco: 90000,
  ),
  Veiculo(
    marca: 'Fiat',
    modelo: 'Pulse',
    ano: 2025,
    preco: 110000,
  ),
  Veiculo(
    marca: 'BMW',
    modelo: '320i',
    ano: 2022,
    preco: 250000,
  ),
];

class CatalogoVeiculosApp extends StatelessWidget {
  const CatalogoVeiculosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Catálogo de Veículos',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.blue),
      ),
      home: const CatalogoVeiculosPage(),
    );
  }
}

class CatalogoVeiculosPage extends StatefulWidget {
  const CatalogoVeiculosPage({super.key});

  @override
  State<CatalogoVeiculosPage> createState() =>
      _CatalogoVeiculosPageState();
}

class _CatalogoVeiculosPageState extends State<CatalogoVeiculosPage> {
  String textoPesquisa = '';

  @override
  Widget build(BuildContext context) {
    final veiculosFiltrados = veiculos.where((veiculo) {
      final pesquisa = textoPesquisa.toLowerCase();

      return veiculo.marca.toLowerCase().contains(pesquisa) ||
          veiculo.modelo.toLowerCase().contains(pesquisa);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo de Veículos'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              onChanged: (texto) {
                setState(() {
                  textoPesquisa = texto;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Pesquisar veículo',
                hintText: 'Digite marca ou modelo',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: veiculosFiltrados.isEmpty
                ? const Center(
                    child: Text(
                      'Nenhum veículo encontrado.',
                    ),
                  )
                : ListView.builder(
                    itemCount: veiculosFiltrados.length,
                    itemBuilder: (context, index) {
                      final veiculo = veiculosFiltrados[index];

                      return ListTile(
                        title: Text(
                          '${veiculo.marca} ${veiculo.modelo}',
                        ),
                        subtitle: Text(
                          'Ano: ${veiculo.ano}\n'
                          'Preço: R\$ ${veiculo.preco.toStringAsFixed(2)}',
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
// 1. Qual é a classe criada para representar um veículo?
// Veiculo.

// 2. Cite um objeto criado a partir dessa classe.
// Toyota Corolla.

// 3. Quais são os atributos da classe?
// marca, modelo, ano e preco.

// 4. Qual método foi criado e o que ele faz?
// O método descricao() foi criado para retornar uma descrição textual
// do veículo utilizando seus próprios atributos.

// 5. Por que a tela de pesquisa precisa de estado?
// Porque o texto pesquisado muda durante a execução e essa mudança
// influencia quais veículos serão exibidos na lista.

// 6. Qual variável armazena o texto pesquisado?
// textoPesquisa armazena o texto digitado pelo usuário.

// 7. Qual lista contém o resultado filtrado?
// A lista veiculosFiltrados contém somente os veículos que correspondem
// ao texto pesquisado.

// 8. Em qual momento setState() é utilizado?
// O setState() é utilizado dentro do onChanged do TextField,
// sempre que o usuário altera o texto da pesquisa.

// 9. Qual é a função do index na construção dos itens?
// O index identifica a posição do veículo dentro da lista filtrada,
// permitindo acessar o veículo correspondente através de
// veiculosFiltrados[index].

// 10. Onde final foi utilizado e por quê?
// final foi utilizado nos atributos marca, modelo e ano da classe Veiculo,
// pois seus valores não precisam ser alterados depois da criação do objeto.
// Também foi utilizado em variáveis que não precisam ser reatribuídas,
// como veiculosFiltrados e veiculo.
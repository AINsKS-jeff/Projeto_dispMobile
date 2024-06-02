import 'package:flutter/material.dart'; 
import 'package:url_launcher/url_launcher.dart';

class Filme {
  final String titulo;
  final String imageUrl;
  final String sinopse;
  final String trailerUrl;
  final double preco;

  Filme({
    required this.titulo,
    required this.imageUrl,
    required this.sinopse,
    required this.trailerUrl,
    required this.preco,
  });
}

class PaginaFilme extends StatefulWidget {
  const PaginaFilme({Key? key}) : super(key: key);

  @override
  _PaginaFilmeState createState() => _PaginaFilmeState();
}

class _PaginaFilmeState extends State<PaginaFilme> {
  String? _selectedDay;
  String? _selectedActionButton;
  Filme? _selectedFilme;

  final List<Filme> filmes = [
    Filme(
      titulo: 'A Noiva-Cadáver',
      imageUrl:
          'https://media.fstatic.com/l5B42Pw7sa7Z_IIAn_l5ArW2xlA=/322x478/smart/filters:format(webp)/media/movies/covers/2018/09/15931e2b41285a02de0dc24cd0d1135d_Mg2rmV6.jpg',
      sinopse:
          'As famílias de Victor e Victoria estão arranjando seu casamento. Nervoso com a cerimônia, Victor vai sozinho à floresta para ensaiar seus votos. No entanto, o que ele pensava ser um tronco de árvore na verdade é o braço esquelético de Emily, uma noiva que foi assassinada depois de fugir com seu amor. Convencida que Victor acabara de lhe pedir a mão em casamento, Emily o leva para o mundo dos mortos, mas ele precisa retornar rapidamente antes que Victoria se case com o malvado Lorde Barkis.',
      trailerUrl: 'https://www.youtube.com/watch?v=AGACeWVdFqo',
      preco: 35.00,
    ),
    Filme(
      titulo: 'Coraline e o Mundo Secreto',
      imageUrl:
          'https://media.fstatic.com/MlcwcypldQ6Qd5lOW6cLgeTBj4k=/322x478/smart/filters:format(webp)/media/movies/covers/2011/12/bcb6354e65f9656d2b92b9fc80aecf93.jpg',
      sinopse: 'Enquanto explora sua nova casa à noite, a pequena Coraline descobre uma porta secreta que contém um mundo parecido com o dela, porém melhor em muitas maneiras. Todos têm botões no lugar dos olhos, os pais são carinhosos e os sonhos de Coraline viram realidade por lá. Ela se encanta com essa descoberta, mas logo percebe que segredos estranhos estão em ação: uma outra mãe e o resto de sua família tentam mantê-la eternamente nesse mundo paralelo.',
      trailerUrl: 'https://www.youtube.com/watch?v=m9bOpeuvNwY',
      preco: 25.00,
    ),
    Filme(
      titulo: 'O Estranho Mundo de Jack',
      imageUrl:
          'https://media.fstatic.com/uOMbxVki4IcQ7UMmw1BOj2aKgRQ=/322x478/smart/filters:format(webp)/media/movies/covers/2016/09/4.jpg',
      sinopse: 'Jack Skellington, o Rei das Abóboras, se cansa de fazer o Dia das Bruxas todos os anos e deixa os limites da cidade. Por acaso, acaba atravessando o portal do Natal, onde vê a alegria do espírito natalino. Ao retornar para a Cidade do Halloween, sem ter compreendido o que viu, ele começa a convencer os cidadãos a sequestrarem o Papai Noel e fazerem seu próprio Natal. Apesar de sua leal namorada Sally ser contra, o Papai Noel é capturado e os fatos mostrarão que Sally estava certa o tempo todo.',
      trailerUrl: 'https://www.youtube.com/watch?v=wr6N_hZyBCk',
      preco: 15.00,
    ),
  ];

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  // Método para navegar para a tela de compra bem-sucedida
  void _navigateToCompraSucesso() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TelaCompraSucesso(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Nessa Semana',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28.0,
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildDayButton("Seg", "14", context),
                  _buildDayButton("Ter", "15", context),
                  _buildDayButton("Qua", "16", context),
                  _buildDayButton("Qui", "17", context),
                  _buildDayButton("Sex", "18", context),
                  _buildDayButton("Sáb", "19", context),
                  _buildDayButton("Dom", "20", context),
                ],
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              height: 300,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: filmes.map((filme) => _buildMoviePoster(filme)).toList(),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Expanded(child: _buildActionButton("19:30")),
                  SizedBox(width: 8),
                  Expanded(child: _buildActionButton("21:30")),
                  SizedBox(width: 8),
                  Expanded(child: _buildActionButton("23:59")),
                ],
              ),
            ),
            SizedBox(height: 16),
            if (_selectedFilme != null) ...[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.tv, size: 24.0),
                        SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _selectedFilme!.titulo,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24.0,
                                ),
                              ),
                              SizedBox(height: 8),
                              GestureDetector(
                                onTap: () => _launchURL(_selectedFilme!.trailerUrl),
                                child: Text(
                                  'Trailer',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: 150,
                      ),
                      child: SingleChildScrollView(
                        child: Text(
                          _selectedFilme!.sinopse,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                           
padding: EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                            ),
                            child: Text(
                              'Preço: R\$ ${_selectedFilme!.preco.toStringAsFixed(2)}',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        ElevatedButton.icon(
                          onPressed: () {
                            // Navegar para a tela de compra bem-sucedida
                            _navigateToCompraSucesso();
                          },
                          icon: Icon(Icons.shopping_cart),
                          label: Text(
                            'Comprar',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            textStyle: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildDayButton(String dayOfWeek, String dayOfMonth, BuildContext context) {
    bool isSelected = _selectedDay == dayOfMonth;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedDay = dayOfMonth;
        });
      },
      child: Container(
        width: 100,
        height: 100,
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: isSelected ? Colors.blue[700] : Colors.blue,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              dayOfWeek,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 8),
            Text(
              dayOfMonth,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMoviePoster(Filme filme) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedFilme = filme;
        });
      },
      child: Container(
        width: 200,
        height: 280,
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.grey[300],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(
            filme.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton(String time) {
    bool isSelected = _selectedActionButton == time;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedActionButton = time;
        });
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: isSelected ? Colors.blue[700] : Colors.blue,
        ),
        child: Center(
          child: Text(
            time,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

// Tela de compra bem-sucedida
class TelaCompraSucesso extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Compra Efetuada Com Sucesso'),
      ),
      body: Center(
        child: Text(
          'Compra Efetuada Com Sucesso',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Interfaces com Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const TelaInicial(),
    );
  }
}

// ======================================================
// TELA INICIAL
// ======================================================

class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interfaces com Flutter'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      drawer: const MenuLateral(),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.phone_android,
              size: 100,
              color: Colors.blue,
            ),
            SizedBox(height: 20),
            Text(
              'Interfaces com Flutter',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Utilize o menu lateral para acessar as telas.',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

// ======================================================
// DRAWER
// ======================================================

class MenuLateral extends StatelessWidget {
  const MenuLateral({super.key});

  void abrirTela(BuildContext context, Widget tela) {
    Navigator.pop(context);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => tela,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.deepPurple,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.flutter_dash,
                  color: Colors.white,
                  size: 50,
                ),
                SizedBox(height: 10),
                Text(
                  'Interfaces Flutter',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          ListTile(
            leading: const Icon(Icons.view_list),
            title: const Text('1 - Lista de Cards'),
            onTap: () {
              abrirTela(context, const TelaUm());
            },
          ),

          ListTile(
            leading: const Icon(Icons.photo_library),
            title: const Text('2 - Galeria Horizontal'),
            onTap: () {
              abrirTela(context, const TelaDois());
            },
          ),

          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('3 - Perfil do Usuário'),
            onTap: () {
              abrirTela(context, const TelaTres());
            },
          ),

          ListTile(
            leading: const Icon(Icons.dashboard),
            title: const Text('4 - Dashboard'),
            onTap: () {
              abrirTela(context, const TelaQuatro());
            },
          ),

          ListTile(
            leading: const Icon(Icons.grid_view),
            title: const Text('5 - Catálogo'),
            onTap: () {
              abrirTela(context, const TelaCinco());
            },
          ),

          ListTile(
            leading: const Icon(Icons.shopping_bag),
            title: const Text('6 - Produto'),
            onTap: () {
              abrirTela(context, const TelaSeis());
            },
          ),
        ],
      ),
    );
  }
}

// ======================================================
// COMPONENTE REUTILIZÁVEL
// ======================================================

class CaixaAzul extends StatelessWidget {
  final double? width;
  final double? height;
  final Widget? child;

  const CaixaAzul({
    super.key,
    this.width,
    this.height,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.blue.shade200,
        borderRadius: BorderRadius.circular(4),
      ),
      child: child,
    );
  }
}

// ======================================================
// TELA 1 - LISTA DE CARDS
// ======================================================

class TelaUm extends StatelessWidget {
  const TelaUm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Cards'),
      ),
      drawer: const MenuLateral(),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 8,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  CaixaAzul(
                    width: 70,
                    height: 70,
                    child: const Icon(
                      Icons.image,
                      size: 35,
                    ),
                  ),

                  const SizedBox(width: 16),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Item ${index + 1}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 8),

                        const Text(
                          'Descrição ou subtítulo do item apresentado na lista.',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// ======================================================
// TELA 2 - GALERIA HORIZONTAL
// ======================================================

class TelaDois extends StatelessWidget {
  const TelaDois({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Galeria Horizontal'),
      ),
      drawer: const MenuLateral(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const CaixaAzul(
              width: double.infinity,
              height: 70,
              child: Center(
                child: Text(
                  'Cabeçalho',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            SizedBox(
              height: 110,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    6,
                    (index) => const Padding(
                      padding: EdgeInsets.only(right: 12),
                      child: CaixaAzul(
                        width: 100,
                        height: 100,
                        child: Icon(
                          Icons.image,
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                children: List.generate(
                  6,
                  (index) => CaixaAzul(
                    child: Center(
                      child: Text(
                        'Imagem ${index + 1}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            const CaixaAzul(
              width: double.infinity,
              height: 50,
              child: Center(
                child: Text('Rodapé'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ======================================================
// TELA 3 - PERFIL DO USUÁRIO
// ======================================================

class TelaTres extends StatelessWidget {
  const TelaTres({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil do Usuário'),
      ),
      drawer: const MenuLateral(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 190,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    height: 130,
                    child: Container(
                      color: Colors.blue.shade300,
                      child: const Icon(
                        Icons.landscape,
                        size: 70,
                      ),
                    ),
                  ),

                  Positioned(
                    bottom: 0,
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.blue.shade100,
                      child: const Icon(
                        Icons.person,
                        size: 75,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            const Text(
              'Nome do Usuário',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              '@usuario',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: const [
                  Expanded(
                    child: InformacaoPerfil(
                      titulo: '120',
                      subtitulo: 'Posts',
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: InformacaoPerfil(
                      titulo: '850',
                      subtitulo: 'Seguidores',
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: InformacaoPerfil(
                      titulo: '300',
                      subtitulo: 'Seguindo',
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CaixaAzul(
                width: double.infinity,
                height: 70,
                child: const Center(
                  child: Text(
                    'Informações do usuário',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CaixaAzul(
                width: double.infinity,
                height: 120,
                child: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'Sobre mim\n\nInformações adicionais e descrição do perfil.',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InformacaoPerfil extends StatelessWidget {
  final String titulo;
  final String subtitulo;

  const InformacaoPerfil({
    super.key,
    required this.titulo,
    required this.subtitulo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue.shade100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(
            titulo,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Text(subtitulo),
        ],
      ),
    );
  }
}

// ======================================================
// TELA 4 - DASHBOARD
// ======================================================

class TelaQuatro extends StatelessWidget {
  const TelaQuatro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Simples'),
      ),
      drawer: const MenuLateral(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const CaixaAzul(
              width: double.infinity,
              height: 60,
              child: Center(
                child: Text(
                  'Dashboard',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),

            Row(
              children: const [
                Expanded(child: DashboardIcone(icon: Icons.person)),
                SizedBox(width: 8),
                Expanded(child: DashboardIcone(icon: Icons.shopping_cart)),
                SizedBox(width: 8),
                Expanded(child: DashboardIcone(icon: Icons.attach_money)),
                SizedBox(width: 8),
                Expanded(child: DashboardIcone(icon: Icons.bar_chart)),
              ],
            ),

            const SizedBox(height: 16),

            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue.shade200,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Center(
                        child: Text(
                          'Card 1',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue.shade200,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Center(
                        child: Text(
                          'Card 2',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            const CaixaAzul(
              width: double.infinity,
              height: 55,
              child: Center(
                child: Text(
                  'Resumo',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue.shade200,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Center(
                  child: Icon(
                    Icons.bar_chart,
                    size: 100,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardIcone extends StatelessWidget {
  final IconData icon;

  const DashboardIcone({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.blue.shade200,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Icon(icon),
    );
  }
}

// ======================================================
// TELA 5 - CATÁLOGO
// ======================================================

class TelaCinco extends StatelessWidget {
  const TelaCinco({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo de Itens'),
      ),
      drawer: const MenuLateral(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Pesquisar...',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                Container(
                  height: 56,
                  width: 56,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade200,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Icon(Icons.filter_list),
                ),
              ],
            ),

            const SizedBox(height: 16),

            Expanded(
              child: GridView.builder(
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.75,
                ),
                itemCount: 12,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.shade300,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: Column(
                        children: [
                          Expanded(
                            child: CaixaAzul(
                              width: double.infinity,
                              child: const Icon(
                                Icons.image,
                                size: 40,
                              ),
                            ),
                          ),

                          const SizedBox(height: 6),

                          Container(
                            width: double.infinity,
                            height: 20,
                            color: Colors.blue.shade100,
                          ),

                          const SizedBox(height: 4),

                          Text(
                            'Item ${index + 1}',
                            style: const TextStyle(
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 12),

            const CaixaAzul(
              width: double.infinity,
              height: 50,
              child: Center(
                child: Text('Rodapé'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ======================================================
// TELA 6 - DETALHES DO PRODUTO
// ======================================================

class TelaSeis extends StatelessWidget {
  const TelaSeis({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Produto'),
      ),
      drawer: const MenuLateral(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CaixaAzul(
              width: double.infinity,
              height: 230,
              child: Icon(
                Icons.image,
                size: 100,
              ),
            ),

            const SizedBox(height: 16),

            Row(
              children: List.generate(
                4,
                (index) => Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      right: index < 3 ? 8 : 0,
                    ),
                    child: const CaixaAzul(
                      height: 70,
                      child: Icon(Icons.image),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Nome do Produto',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Row(
              children: const [
                Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                Icon(
                  Icons.star_half,
                  color: Colors.amber,
                ),
                SizedBox(width: 8),
                Text('4.5'),
              ],
            ),

            const SizedBox(height: 16),

            const Text(
              'R\$ 199,90',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Descrição',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Text(
                'Descrição detalhada do produto. Aqui podem ser '
                'apresentadas suas características, informações '
                'adicionais e especificações.',
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Comprar',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
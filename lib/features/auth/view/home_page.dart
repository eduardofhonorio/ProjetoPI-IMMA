import 'package:flutter/material.dart';
import 'package:projeto02/app/routes/app_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final Color corPrimaria = const Color(0xFF480404);
  final Color corFundo = const Color(0xFFFFF9F0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: corFundo,
      appBar: AppBar(
        backgroundColor: corPrimaria,
        elevation: 0,
        toolbarHeight: 70,
        title: Image.asset(
          "assets/images/logo_IMMA.png",
          height: 45,
          errorBuilder: (context, error, stackTrace) =>
              const Icon(Icons.local_shipping, size: 40, color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle_outlined, color: Colors.white, size: 28), 
            onPressed: () {}
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.white, size: 28), 
            onPressed: () {}
          ),
          IconButton(
            icon: const Icon(Icons.settings_outlined, color: Colors.white, size: 28),
            onPressed: () => Navigator.pushReplacementNamed(context, AppRoutes.login),
            tooltip: 'Sair / Logout',
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: const TextSpan(
                text: 'Olá, ',
                style: TextStyle(fontSize: 24, color: Colors.black87),
                children: [
                  TextSpan(
                    text: '[nome do vendedor]!',
                    style: TextStyle(fontWeight: FontWeight.w900, color: Colors.black),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Icon(Icons.location_on_outlined, color: corPrimaria, size: 32),
                const SizedBox(width: 12),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Rota de Hoje:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('[cidade do dia]', style: TextStyle(fontSize: 16, color: Colors.black87)),
                  ],
                )
              ],
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Icon(Icons.inventory_2_outlined, color: corPrimaria, size: 30),
                const SizedBox(width: 12),
                const Text(
                  'Produtos em Estoque:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 16),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 0.95,
              children: [
                _buildCategoriaCard('Alimentos', 'assets/images/alimentos.png'),
                _buildCategoriaCard('Higiene &\nLimpeza', 'assets/images/higiene.png'),
                _buildCategoriaCard('Utilidades &\nDiversos', 'assets/images/utilidades.png'),
                _buildCategoriaCard('Bebidas', 'assets/images/bebidas.png'),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      _buildInfoCard(
                        'Pedidos Recentes',
                        '5 novos pedidos hoje:\nR\$ 2.728,59',
                        Icons.receipt_long_outlined,
                      ),
                      const SizedBox(height: 12),
                      _buildInfoCard(
                        'Metas Mensais',
                        '72% Concluído:\nR\$ 25.693,29 de R\$ 40.500,00',
                        Icons.show_chart,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 185,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4)),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Destaques do Dia', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        const Spacer(),
                        Icon(Icons.local_offer_outlined, color: corPrimaria, size: 40),
                        const SizedBox(height: 12),
                        const Text('Ofertas &\nNovidades', style: TextStyle(fontSize: 16, color: Colors.black87)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: corPrimaria,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildBottomNavItem(Icons.people_alt_outlined, 'Clientes', false, () {}),
              _buildBottomNavItem(Icons.home_outlined, 'Início', true, () {}),
              _buildBottomNavItem(Icons.content_paste_outlined, 'Pedidos', false, () {
                Navigator.pushReplacementNamed(context, AppRoutes.pedidos);
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoriaCard(String titulo, String imagePath) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset(
                imagePath,
                errorBuilder: (context, error, stackTrace) =>
                    Icon(Icons.image_not_supported, color: Colors.grey.shade300, size: 50),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Text(
              titulo,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: corPrimaria,
                fontWeight: FontWeight.w900,
                fontSize: 16,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildInfoCard(String titulo, String subtitulo, IconData icone) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icone, color: corPrimaria, size: 28),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(titulo, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                const SizedBox(height: 4),
                Text(subtitulo, style: const TextStyle(fontSize: 11, color: Colors.black87)),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBottomNavItem(IconData icone, String label, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icone, color: isSelected ? Colors.white : Colors.white60, size: 28),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.white60,
              fontSize: 12,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          )
        ],
      ),
    );
  }
}
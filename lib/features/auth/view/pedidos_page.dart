import 'package:flutter/material.dart';
import 'package:projeto02/app/routes/app_routes.dart';

class PedidosPage extends StatefulWidget {
  const PedidosPage({super.key});

  @override
  State<PedidosPage> createState() => _PedidosPageState();
}

class _PedidosPageState extends State<PedidosPage> {
  final Color corPrimaria = const Color(0xFF480404);
  final Color corFundo = const Color(0xFFFFF9F0);

  // Dados mockados para simular a lista do design
  final List<Map<String, String>> pedidos = [
    {'cliente': 'Mercado do Zé', 'valor': 'R\$ 1.250,00', 'id': 'Pedido #2026-03-03-A1', 'hora': '08:30'},
    {'cliente': 'Mercado Correa', 'valor': 'R\$ 678,50', 'id': 'Pedido #2026-03-03-A2', 'hora': '09:00'},
    {'cliente': 'Mercado do Junin', 'valor': 'R\$ 1.250,00', 'id': 'Pedido #2026-03-03-A3', 'hora': '09:40'},
    {'cliente': 'Mercado da Rosa', 'valor': 'R\$ 2.560,00', 'id': 'Pedido #2026-03-03-A4', 'hora': '10:30'},
    {'cliente': 'Mercado Luz', 'valor': 'R\$ 1.690,00', 'id': 'Pedido #2026-03-03-A5', 'hora': '11:15'},
  ];

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
          IconButton(icon: const Icon(Icons.account_circle_outlined, color: Colors.white, size: 28), onPressed: () {}),
          IconButton(icon: const Icon(Icons.notifications_none, color: Colors.white, size: 28), onPressed: () {}),
          IconButton(
            icon: const Icon(Icons.settings_outlined, color: Colors.white, size: 28),
            onPressed: () => Navigator.pushReplacementNamed(context, AppRoutes.login),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            
            // Barra de Busca
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: corPrimaria, width: 2.5),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Buscar pedidos',
                  hintStyle: const TextStyle(fontSize: 16, color: Colors.black54),
                  prefixIcon: Icon(Icons.search, color: corPrimaria, size: 28),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Filtros Horizontal
            Row(
              children: [
                Icon(Icons.filter_alt_outlined, color: corPrimaria, size: 28),
                const SizedBox(width: 8),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildFilterChip('Todos', false),
                        _buildFilterChip('Hoje', true), // Filtro selecionado
                        _buildFilterChip('Ontem', false),
                        _buildFilterChip('Últimos 7 dias', false),
                        _buildFilterChip('Fevereiro', false),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Lista de Pedidos
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(bottom: 100),
                itemCount: pedidos.length,
                itemBuilder: (context, index) {
                  return _buildPedidoCard(pedidos[index]);
                },
              ),
            ),
          ],
        ),
      ),

      // Botão Flutuante (Novo Pedido) customizado igual à imagem
      floatingActionButton: SizedBox(
        width: 85,
        height: 85,
        child: FloatingActionButton(
          backgroundColor: const Color(0xFFB70000), // Vermelho vibrante
          shape: const CircleBorder(),
          elevation: 6,
          onPressed: () {},
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add, color: Colors.white, size: 36),
              Text(
                'Novo Pedido',
                style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
      
      // Bottom Navigation Bar (Pílula) com aba Pedidos ativada
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
              _buildBottomNavItem(Icons.home_outlined, 'Início', false, () {
                Navigator.pushReplacementNamed(context, AppRoutes.home);
              }),
              _buildBottomNavItem(Icons.content_paste_outlined, 'Pedidos', true, () {}),
            ],
          ),
        ),
      ),
    );
  }

  // Widget das Pílulas de Filtro (Hoje, Ontem, etc)
  Widget _buildFilterChip(String label, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: isSelected ? corPrimaria : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: corPrimaria, width: 1.5),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : corPrimaria,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    );
  }

  // Widget do Card de Pedido 
  Widget _buildPedidoCard(Map<String, String> pedido) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: corPrimaria, width: 2),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 6, offset: const Offset(0, 4)),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Lado Esquerdo (Cliente e Valor)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(pedido['cliente']!, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87)),
              const SizedBox(height: 4),
              Text(pedido['valor']!, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87)),
              const SizedBox(height: 12),
              Text(pedido['id']!, style: const TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.w600)),
            ],
          ),
          // Lado Direito (Ícone Olho e Hora)
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Icon(Icons.visibility, color: corPrimaria, size: 28),
                  Text(
                    'Visualizar\nPedido',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 10, color: corPrimaria, fontWeight: FontWeight.w800),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(pedido['hora']!, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black87)),
            ],
          ),
        ],
      ),
    );
  }

  // Botões da Barra Inferior com função de clique
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
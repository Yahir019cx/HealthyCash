import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar personalizado
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        toolbarHeight: 80,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Texto de bienvenida
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Bienvenido a',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.grey,
                        ),
                  ),
                  Text(
                    'HealthyCash',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
              // Avatar cuadrado
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/img/robot.png', // Ruta de la imagen
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),

      // Cuerpo principal de la pantalla envuelto en SafeArea y SingleChildScrollView
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Título de la sección de categorías
                Text(
                  'Categoría',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF3C9484), // .color3
                      ),
                ),
                const SizedBox(height: 16),

                // Botones de categorías
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _categoryButton('Ingresos', const Color(0xFF3CAC94)), // .color1
                    _categoryButton('Gastos', const Color(0xFF56ABA2)), // .color4
                    _categoryButton('Ahorro', const Color.fromARGB(255, 29, 208, 193)), // .color2
                  ],
                ),
                const SizedBox(height: 24),

                // Tarjeta de gráficos
                Card(
                  color: const Color(0xFFB4CCD4), // Fondo de la tarjeta
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        // Imagen en la tarjeta
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            'assets/img/chart.png', // Ruta de la imagen
                            width: 60, // Ancho de la imagen
                            height: 60, // Alto de la imagen
                            fit: BoxFit.cover, // Ajuste de la imagen
                          ),
                        ),
                        const SizedBox(width: 16), // Espacio entre la imagen y el texto

                        // Texto en la tarjeta
                        Expanded(
                          child: Text(
                            'Genera gráficos\ncon nuestra aplicación',
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                          ),
                        ),

                        // Botón circular
                        ElevatedButton(
                          onPressed: () {
                            // Acción del botón
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF3CAC94), // .color1
                            shape: const CircleBorder(),
                            padding: const EdgeInsets.all(8), // Tamaño reducido
                          ),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 20, // Tamaño reducido del ícono
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Nueva sección de tarjetas
                Text(
                  'Categorías',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                ),
                const SizedBox(height: 46),

                // Tarjetas de categorías con ajuste para sobresalir
                Stack(
                  clipBehavior: Clip.none, // Permitir que las imágenes sobresalgan
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildCategoryCard(
                          title: 'Comida',
                          description: 'Registra tus gastos en comidas diarias',
                          color: const Color(0xFFFFA07A), // Color 1
                          imagePath: 'assets/img/comida.png', // Imagen
                        ),
                        _buildCategoryCard(
                          title: 'Ocio',
                          description: 'Registra tus gastos en salidas,\nsuscripciones, etc.',
                          color: const Color(0xFFFFBF86), // Color 2
                          imagePath: 'assets/img/entretenimiento.png', // Imagen
                        ),
                        _buildCategoryCardWithButton(
                          title: 'Crear',
                          description: 'Crea una categoría nueva como transporte, estudios, etc.',
                          color: const Color(0xFFD8BFD8), // Color 3
                          imagePath: 'assets/img/crear.png', // Imagen
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget para los botones de categoría
  Widget _categoryButton(String text, Color color) {
    return ElevatedButton(
      onPressed: () {
        // Acción de los botones
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: color, // Color del botón
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Esquinas redondeadas
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white, // Texto blanco
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // Widget para tarjetas de categoría
  Widget _buildCategoryCard({
    required String title,
    required String description,
    required Color color,
    required String imagePath,
  }) {
    return Expanded(
      child: Stack(
        clipBehavior: Clip.none, // Permitir que las imágenes sobresalgan
        children: [
          Container(
            
            height: 260, // Altura de la tarjeta
            margin: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(46),
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 50, left: 16, right: 16, bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Título
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Descripción
                  Text(
                    description,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: Color.fromARGB(179, 0, 0, 0),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            
            top: -30, // Posición de la imagen para que sobresalga
            left: -7,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(1),
              child: Image.asset(
                imagePath,
                height: 80, // Tamaño de la imagen
                width: 80,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget para la tarjeta con botón adicional
  Widget _buildCategoryCardWithButton({
  required String title,
  required String description,
  required Color color,
  required String imagePath,
}) {
  return Expanded(
    child: Stack(
      clipBehavior: Clip.none, // Permitir que las imágenes sobresalgan
      children: [
        Container(
          height: 260, // Altura ajustada para que el botón encaje
          margin: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(46),
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 50, left: 16, right: 16, bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Título
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),

                // Descripción
                Text(
                  description,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: Color.fromARGB(179, 0, 0, 0),
                  ),
                ),
                const Spacer(), // Empuja el botón hacia abajo

                // Botón alineado a la izquierda
                Align(
                  alignment: Alignment.centerRight, 
                  child: ElevatedButton(
                    onPressed: () {
                      // Acción al pulsar el botón
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF56ABA2),
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(12),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Color.fromARGB(255, 255, 255, 255),
                      size: 24,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: -30, // Posición de la imagen para que sobresalga
          left: -7,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(1),
            child: Image.asset(
              imagePath,
              height: 80, // Tamaño de la imagen
              width: 80,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    ),
  );
}


}

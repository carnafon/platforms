
# Basque Platformer (Godot 4, Web)

Proyecto base de plataformas 2D con estética cartoon inspirada en el País Vasco: montes, caseríos, mar y clima húmedo (niebla y lluvia).

## Contenido
- **Jugador**: movimiento, salto, doble salto, dash, deslizamiento/brinco en paredes.
- **Fondos con parallax**: cielo, montes, colinas y mar.
- **Clima**: shader de **niebla** + shader de **lluvia**.
- **Recolectables**: monedas.
- **UI**: contador simple de monedas.

## Requisitos
- Godot **4.x**

## Ejecutar
1. Abre Godot y carga la carpeta del proyecto.
2. Pulsa ▶️ para ejecutar.

Controles: 
- **←/→** moverse
- **Espacio** saltar (doble salto)
- **X** dash

## Exportar a Web (HTML5)
1. Instala el **export template** de Godot 4 si no lo tienes (Editor → Manage Export Templates).
2. Project → **Export...** → añade preset **Web** → Export Project.

## Personalización
- Reemplaza `assets/backgrounds/*.png` por tus fondos.
- Cambia el sprite de jugador en `assets/sprites/player.png`.
- Ajusta físicas en `scripts/Player.gd`.
- Añade niveles nuevos duplicando `scenes/Level1.tscn`.

¡Aupa! 🎮

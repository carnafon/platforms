
shader_type canvas_item;

uniform float density : hint_range(0.0, 1.0) = 0.5; // line density
uniform float speed = 1.5;
uniform float angle = -0.6; // radians, negative for slant to the left
uniform vec4 color : source_color = vec4(0.8,0.9,1.0,0.25);

void fragment(){
    vec2 uv = UV;
    // rotate UV by angle
    float ca = cos(angle); float sa = sin(angle);
    vec2 tuv = vec2(ca*uv.x - sa*uv.y, sa*uv.x + ca*uv.y);
    float t = TIME * speed;
    float line = fract(tuv.y*20.0 + t);
    float mask = step(line, density*0.5) * (1.0 - smoothstep(density*0.5, density*0.5+0.02, line));
    COLOR = color * mask;
}

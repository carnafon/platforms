
shader_type canvas_item;

uniform sampler2D noise_tex: filter_linear_repeat;
uniform float intensity : hint_range(0.0,1.0) = 0.6;
uniform float speed = 0.02;
uniform vec2 direction = vec2(0.2, 0.0);
uniform vec4 fog_color : source_color = vec4(0.85,0.9,0.95,1.0);

void fragment(){
    vec2 uv = UV * 2.0; // scale noise
    vec2 flow = uv + direction * TIME * speed;
    float n = texture(noise_tex, flow).r;
    float alpha = smoothstep(0.4, 1.0, n) * intensity;
    COLOR = vec4(fog_color.rgb, alpha);
}

////Shader ported INinja_Studio////

shader_type canvas_item;


uniform float time;
uniform vec2 resolution;

void fragment() {
	float a = FRAGCOORD.x / 512.0;
	COLOR = vec4(vec3(a), 0.5);
}
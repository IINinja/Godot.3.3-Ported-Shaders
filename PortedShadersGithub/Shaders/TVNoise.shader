////Shader ported INinja_Studio////

shader_type canvas_item;



uniform float time;
uniform vec2 mouse;
uniform vec2 resolution;
const float pi=3.1415926;

float random(float seed, vec2 pos){
	vec2 r=vec2(seed*79.0*tan(24.0), exp(10.0/seed+14.0));
	return fract(sin(dot(pos, r))*pow(10.0, seed));
}


void fragment() {
	
	
	vec2 position = ( FRAGCOORD.xy / resolution.xy / TIME);
	float color=0.0;
	float OSC=random(2.0 / 1000.0+TIME, position.yy);
	color += random(6.0 / 1000.0+ TIME, position)+0.1*OSC;
	
	
	
	COLOR = vec4( color, color , color, 1.0 );

}
////Shader ported INinja_Studio////

shader_type canvas_item;



uniform float time;
uniform vec2 mouse;
uniform vec2 resolution;

void fragment(){

	vec2 position = ( FRAGCOORD.xy / resolution.xy ) + mouse / 4.0;

	float color = 0.0;
	color += sin( position.x * cos( TIME/ 1.0 ) * 80.0 ) + cos( position.y * cos( TIME / 15.0 ) * 10.0 );
	color += sin( position.y * sin( TIME / 1.0 ) * 40.0 ) + cos( position.x * sin( TIME / 25.0 ) * 40.0 );
	color += sin( position.x * sin( TIME / 1.0 ) * 10.0 ) + sin( position.y * sin( TIME/ 35.0 ) * 80.0 );
	color *= sin( TIME / 10.0 ) * 0.5;

	COLOR = vec4( vec3( color, color * 0.5, sin( color + TIME / 3.0 ) * 0.5 ), 123.0 );

}
////Shader ported INinja_Studio////

shader_type canvas_item;

uniform vec2 resolution = vec2(1024, 600);
uniform float time;



const float PI = float (radians(float(180.0)));
float random(vec2 st)
{
	return fract(sin(dot(st, vec2(124.2, 63.36))) * 152472.125);
}

vec2 rotate2D(vec2 p, float r)
{
	float s=sin(r), c=cos(r);
	return (p-vec2(0.5))*mat2(vec2(c, -s), vec2(-s, c) + vec2(0.5));
}

void fragment()
{
	
	vec2 st = FRAGCOORD.xy / resolution.x * 0.2;
	st *= 90.0;
	st += vec2(TIME, TIME+sin(TIME*0.1));

	const float speed = 4.0;
	const float border = 0.17;
	
	float randval = random(floor(st));
	vec2 pos = rotate2D(fract(st), TIME* max(randval * speed, 1.5) );
	float f = step(border, pos.x)*step(border, pos.y) * step(pos.x, 0.4 -border)*step(pos.y, 0.4 -border);
	vec3 color = vec3(max(randval, 0.0), 0.0, 0.1);
	
	COLOR = vec4(color*f, 0.5);
}

////Shader ported INinja_Studio////

shader_type canvas_item;




uniform float time;
uniform vec2 resolution;


void fragment()
{
	vec2 uv = FRAGCOORD.xy / resolution.xy;
    
    vec3 rgb = vec3(0.,0.,0.);
	float s= .3;
	float t=TIME*.12;
	
	float f=resolution.x/resolution.y;
	vec2 pos  = mod(vec2(uv.x*f,uv.y+s*.26)+ vec2(.0,s*.5)+ vec2(t*1.5,0.), vec2(s)) - vec2(s*.5);
	vec2 pos2 = mod(vec2(uv.x*f,uv.y+s*.26)+ vec2(s*.0)  + vec2(0.,t*1.5), vec2(s)) - vec2(s*.5);
	float d1= dot(pos, pos)*1000.;
	float d2= dot(pos2, pos2)*1000.;
    
	rgb.r+=(1.-step(sin(uv.x*f*50.)*.1+.3, d1 *1.7))*.8;
	rgb.b+=.2*rgb.r;

	rgb.b+=(1.-step(sin(uv.y*50.)*.1+.3, d2 *1.7))*.8;
	rgb.r+=.1*rgb.b;

	rgb.g+=(rgb.r*.3+rgb.b*.7)*.5;
    
	COLOR = vec4(rgb,1.);
	}
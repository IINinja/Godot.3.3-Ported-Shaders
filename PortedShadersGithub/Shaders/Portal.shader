////Shader ported INinja_Studio////

shader_type canvas_item;


uniform float time;
uniform vec2 resolution;





float variation(vec2 v1, vec2 v2, float strength, float speed) {
	return sin(
        dot(normalize(v1), normalize(v2)) * strength + time * speed
    ) / 100.;
}


vec3 paintCircle (vec2 uv, vec2 center, float rad, float width, float index) {
    vec2 diff = center-uv;
    float len = length(diff);
    float scale = rad;
	float mult = mod(index, 2.) == 0. ? 1. : -1.; 
    len += variation(diff, vec2(rad*mult, 1.0), 7.0*scale, 2.0);
    len -= variation(diff, vec2(1.0, rad*mult), 7.0*scale, 2.0);
    float circle = smoothstep((rad-width)*scale, (rad)*scale, len) - smoothstep((rad)*scale, (rad+width)*scale, len);
    return vec3(circle);
}


vec3 paintRing(vec2 uv, vec2 center, float radius, float index){
     
    vec3 color = paintCircle(uv, center, radius, 0.075, index);
    
    color *= vec3(0.3,0.85,1.0);
    
    color += paintCircle(uv, center, radius, 0.015, index);
    return color;
}


void fragment()
{
    
	vec2 uv = FRAGCOORD.xy /resolution.xy;
    const float numRings = 20.;
    const vec2 center = vec2(0.5);
    const float spacing = 1. / numRings;
    const float slow = 30.;
    const float cycleDur = 1.;
    const float tunnelElongation = .25;
    float radius = mod(TIME/slow, cycleDur);
    vec3 color = vec3(0.);

    
    float border = 0.25;
    vec2 bl = smoothstep(0., border, uv); 
    vec2 tr = smoothstep(0., border, 1.-uv);
    float edges = bl.x * bl.y * tr.x * tr.y;
	
	
    uv.x *= 1.5;
    uv.x -= 0.25; 
    
    
    for(float i=0.; i<numRings; i++){
   		color += paintRing(uv, center, tunnelElongation*log(mod(radius + i * spacing, cycleDur)), i ); 
        color += paintRing(uv, center, log(mod(radius + i * spacing, cycleDur)), i); 
    }

    
    color = mix(color, vec3(0.), 1.-edges); 
    color = mix(color, vec3(0.), distance(uv, center));
    
	COLOR = vec4(color, 1.0);
}
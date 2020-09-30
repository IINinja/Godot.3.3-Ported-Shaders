////Shader ported INinja_Studio////

shader_type canvas_item;



uniform vec2 mouse;
uniform vec2 resolution;



float distanceFunction(vec3 pos) {
	float d = length(pos) - 1.0;
	return d;
}

float sdSphere(vec3 p, float r) {
	float d = length(p) - r;
	return d;
}

float sdPlane(vec3 p) {
	float d = p.y;
	return d;
}

float sdBox(vec3 p, float s) {
	p = abs(p) - s;
	return max(max(p.x, p.y), p.z);
}


void fragment () {
	vec2 p = (FRAGCOORD.xy * 2. - resolution.xy) / min(resolution.x,resolution.y);
	
	vec3 cameraPos = vec3(0.1,0.1,9.);
	float screenZ = 11.5;
	vec3 rayDirection = normalize(vec3(p, screenZ));
	
	float depth = 0.0;
	vec3 col = vec3(0.0);
	
	for(int i=-100; i<99; i++) {
		vec3 rayPos = cameraPos + rayDirection * depth;
		rayPos += vec3(tan(TIME/2.), sin(TIME), TIME * 1.);
		rayPos = mod(rayPos-2., 5.) -2.;
		float dist = sdSphere(rayPos, 0.03);
		if(dist < 0.000009) {
			col = vec3(1.);
			break;
		}
		depth += dist;
	}
	
	COLOR = vec4(col,4.);
}
#version 330

layout(location = 0) in vec2 v;

out INTERFACE {
	vec2 uv;
} Out ;


uniform bool behindKeyboard;
uniform float keyboardHeight;

void main(){
	vec2 pos = v;
	if(!behindKeyboard){
		pos.y = (1 - keyboardHeight) * pos.y + keyboardHeight;
	}
	// We directly output the position.
	gl_Position = vec4(pos, 0.0, 1.0);
	// Output the UV coordinates computed from the positions.
	Out.uv = v.xy * 0.5 + 0.5;
	
}

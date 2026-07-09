#version 330

#moj_import<minecraft:globals.glsl>

uniform sampler2D InSampler;

layout(std140)uniform SamplerInfo{
  vec2 OutSize;
  vec2 InSize;
};

layout(std140)uniform CustomConfig{
  float Intensity;
};

in vec2 texCoord;

out vec4 fragColor;

float rand(vec2 co){
  return fract(sin(dot(co.xy,vec2(12.9898,78.233)))*43758.5453);
}

void main(){
  float ra=1.-rand(gl_FragCoord.xy/InSize+GameTime)*Intensity*length(texCoord-.5)/sqrt(.5);
  vec4 col=texture(InSampler,texCoord);
  fragColor=col*vec4(ra,ra,ra,1.);
}

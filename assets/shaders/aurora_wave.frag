#version 320 es
precision mediump float;

uniform float intensity;
uniform float time;
uniform vec2 resolution;

out vec4 fragColor;

void main() {
  vec2 uv = gl_FragCoord.xy / resolution;
  float wave = sin(uv.x * 10.0 + time * 0.5) * 0.5 + 0.5;
  vec3 color = mix(vec3(0.05, 0.03, 0.1), vec3(0.11, 0.0, 0.6), wave);
  fragColor = vec4(color * intensity, 1.0);
}
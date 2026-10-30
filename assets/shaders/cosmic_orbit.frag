#version 320 es
precision mediump float;

uniform float time;
uniform vec2 resolution;

out vec4 fragColor;

void main() {
  vec2 uv = gl_FragCoord.xy / resolution;
  float orbit = sin(length(uv - 0.5) * 10.0 - time * 0.8);
  fragColor = vec4(0.05, 0.15, 0.3, orbit * 0.35);
}
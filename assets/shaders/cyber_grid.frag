#version 320 es
precision mediump float;

uniform float intensity;
uniform vec2 resolution;

out vec4 fragColor;

void main() {
  vec2 uv = gl_FragCoord.xy / resolution;
  float grid = step(0.98, fract(uv.x * 20.0)) + step(0.98, fract(uv.y * 20.0));
  fragColor = vec4(0.1, 0.0, 0.6, grid * intensity);
}
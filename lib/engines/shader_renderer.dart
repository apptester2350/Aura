class ShaderRenderer {
  static bool shouldUseShader() {
    return true;
  }

  static String getShaderSource(String name) {
    return 'assets/shaders/$name.frag';
  }

  static double getIntesity() => 0.45;
}

class AppDataModel {
  final String packageName;
  final String label;
  final bool isInstalled;

  AppDataModel({
    required this.packageName,
    required this.label,
    this.isInstalled = true,
  });
}
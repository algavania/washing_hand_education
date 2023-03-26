class StepModel {
  final String text;
  final bool state;
  final int duration;
  final double? fontSize;

  StepModel({required this.text, required this.state, this.duration = 10, this.fontSize});
}
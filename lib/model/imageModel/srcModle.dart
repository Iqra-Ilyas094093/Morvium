class Src {
  final String original;
  final String large2x;
  final String large;
  final String medium;
  final String small;
  final String portrait;
  final String landscape;
  final String tiny;

  Src({
    required this.large2x,
    required this.large,
    required this.medium,
    required this.small,
    required this.portrait,
    required this.landscape,
    required this.tiny,
    required this.original,
  });
  Src.empty()
  :original = '',
  large = '',
  large2x = '',
  medium = '',
  small = '',
  portrait = '',
  landscape = '',
  tiny = '';

  factory Src.fromJson(Map<String, dynamic> json) {
    return Src(
      large2x: json['large2x'],
      large: json['large'],
      medium: json['medium'],
      small: json['small'],
      portrait: json['portrait'],
      landscape: json['landscape'],
      tiny: json['tiny'],
      original: json['original'],
    );
  }
}

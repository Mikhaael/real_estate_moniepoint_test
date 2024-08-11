mixin Searchable {
  bool search(String filter) {
    var title = getTitle();
    if (title == "" || title == null) {
      title = "";
    }
    final acronym = title
        .split(" ")
        .where((i) => i.isNotEmpty)
        .map((i) => i.substring(0, 1))
        .join("");
    final acronymTwoChars = title
        .split(" ")
        .where((i) => i.length >= 2)
        .map((i) => i.substring(0, 2))
        .join("");
    return title.contains(RegExp(filter, caseSensitive: false)) ||
        getSubtitle().contains(RegExp(filter, caseSensitive: false)) ||
        (acronym.contains(RegExp(filter, caseSensitive: false))) ||
        (acronymTwoChars.contains(RegExp(filter, caseSensitive: false)));
  }

  String? getTitle();

  String getSubtitle();
}

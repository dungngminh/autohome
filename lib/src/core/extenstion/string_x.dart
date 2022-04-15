extension StringX on String {
  String convertSmallerLocationName() {
    if (length > 7) {
      String newString = '';
      List<String> splitted = split(' ');

      newString += splitted.removeAt(0)[0] + '.' + splitted.join();
      return newString;
    } else {
      return this;
    }
  }
}

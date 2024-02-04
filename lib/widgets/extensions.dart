extension FarsiNumberExtension on String{
  String get farsiNumber{
    const English = ['0','1','2','3','4','5','6','7','8','9'];
    const Farsi = ['۰','۱','۲','۳','۴','۵','۶','۷','۸','۹'];
    String text = this;
    for(int i = 0; i < English.length; i++){
      text = text.replaceAll(English[i], Farsi[i]);
    }
    return text;
  }
}
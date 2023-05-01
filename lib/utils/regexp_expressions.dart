abstract class RegexpExpressions {
  static RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  static RegExp emptyTextFieldRegExp = RegExp('[ ]');
}
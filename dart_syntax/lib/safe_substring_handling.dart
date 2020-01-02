//展示基于UTF-16的安全的substring操作
//As we said, often you don’t need to worry about characters and code points. If all you do is receive, pass around, and hand over whole strings, the internal encoding is transparent.
//上面这句话是说如果我们只是对整段string进行接收，传递， hand over whole strings，那么UTF-16编码对我们是透明的，不会触发什么问题
//But if you need to iterate over the characters of a string or to manipulate the contents of a string, you can get into trouble.
//上面是说在string上做迭代,通常会遇到遇到一些问题,比如:
// New longer input list:
var input = <String>[
  'Resume',
  'Résumé',
  '이력서',
  '💼📃',
  'Currículo'
]; //这里手提箱后面的paper是U+d83d U+dcc3编码，超过了utf16，所以触发了问题

void main() {
  input.forEach((value) {
    print(value.substring(0, 3));
  });

  // The good news is that Dart 2.7 introduces a new package, characters,for handling these cases.
  input.forEach((s) {
    input.forEach((s) => print(s.characters.take(3)));
  });
}

# Maintainer: aco acoolon@web.de
pkgname=java-antlr4
pkgver=4.1
pkgrel=1
pkgdesc="ANTLR (ANother Tool for Language Recognition) is a powerful parser generator for reading, processing, executing, or translating structured text or binary files."
url="http://www.antlr.org"
arch=('any')
license=('BSD')
depends=('java-runtime')
optdepends=('java-environment')
source=("http://www.antlr.org/download/antlr-$pkgver-complete.jar"
        "antlr4"
        "grun"
        "java-antlr4.sh"
        "java-antlr4.csh")
md5sums=('da9ec6212b29651abf45a76f3be813f1'
         '602d579672804e4d9295f452b94c1945'
         '60e55320d0dc602d22a7d20209abba28'
         '5c6c135745d052b1177c3447c5c318a1'
         'e321e558828ba6d0429407f14495759a')

package() {
  install -D "$srcdir/antlr4" "$pkgdir/usr/bin/antlr4"
  install -D "$srcdir/grun" "$pkgdir/usr/bin/grun"
  install -D "$srcdir/java-antlr4.sh" "$pkgdir/etc/profile.d/java-antlr4.sh"
  install -D "$srcdir/java-antlr4.csh" "$pkgdir/etc/profile.d/java-antlr4.csh"
  install -D "$srcdir/antlr-$pkgver-complete.jar" "$pkgdir/usr/share/java/antlr4/antlr-$pkgver-complete.jar"
}

# vim:set ts=2 sw=2 et:

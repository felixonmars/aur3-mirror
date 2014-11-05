# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=scala-bin
pkgver=2.11.4
pkgrel=1
pkgdesc="A Java-interoperable language with object-oriented and functional features"
arch=('any')
url="http://www.scala-lang.org"
license=('custom')
depends=('bash' 'java-environment>=6')
source=(http://downloads.typesafe.com/scala/$pkgver/scala-$pkgver.tgz)
md5sums=('ab1a136439d9f79414560a1cb63634a4')
conflicts=('scala')
provides=("scala=$pkgver")
replaces=('scala')

package() {
  cd $srcdir/scala-$pkgver

  install -d $pkgdir/usr/{bin,share} $pkgdir/usr/share/man/man1 $pkgdir/usr/share/scala/{bin,lib}
  cp -r lib $pkgdir/usr/share/scala/
  cp -r man $pkgdir/usr/share/
  install -m 755 bin/{fsc,scala,scalac,scalap,scaladoc} $pkgdir/usr/share/scala/bin
  install -D -m0644 doc/LICENSE.md $pkgdir/usr/share/licenses/$pkgname/LICENSE
  ln -s ../share/scala/bin/fsc $pkgdir/usr/bin/fsc
  ln -s ../share/scala/bin/scala $pkgdir/usr/bin/scala
  ln -s ../share/scala/bin/scalac $pkgdir/usr/bin/scalac
  ln -s ../share/scala/bin/scalap $pkgdir/usr/bin/scalap
  ln -s ../share/scala/bin/scaladoc $pkgdir/usr/bin/scaladoc
}

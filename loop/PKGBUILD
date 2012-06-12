# Maintainer: Daniel Duan <danmarner at gmail dot com>
pkgname=loop
pkgver=1.0.8
pkgrel=2
pkgdesc='A little language for the jvm with a particular focus on simplicity and parallelism.'
arch=('any')
url='http://looplang.org'
license=('MIT')
depends=('java-runtime')
provides=("$pkgname-$pkgver")
conflicts=("$pkgname-$pkgver")
install=
changelog=
source=($pkgname-$pkgver.tar.gz::https://github.com/dhanji/loop/blob/master/dist/loop.tar.gz?raw=true)
noextract=()
md5sums=('4cda52e8aae5affa9a7b7c086b69a4ba')
package() {
  install -d $pkgdir/usr/bin
  install -d $pkgdir/usr/share/java/$pkgname
  install -d $pkgdir/usr/share/licenses/$pkgname

  cd "$srcdir/$pkgname"
  cp loop.jar $pkgdir/usr/share/java/$pkgname/
  cp LICENSE $pkgdir/usr/share/licenses/$pkgname/
  echo '#!/bin/sh' > $pkgdir/usr/bin/$pkgname
  echo '"$JAVA_HOME/bin/java"'" -jar /usr/share/java/$pkgname/$pkgname.jar" >>\
      $pkgdir/usr/bin/$pkgname
  chmod +x $pkgdir/usr/bin/$pkgname
}

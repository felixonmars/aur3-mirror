# Maintainer: Vorzard <vorzard at plexomat dot com>

pkgname=google-guice
pkgver=3.0
pkgrel=1
pkgdesc="A lightweight dependency injection framework for Java"
arch=('any')
url="http://code.google.com/p/google-guice/"
license=('Apache')
depends=('java-environment')
source=("http://google-guice.googlecode.com/files/guice-$pkgver.zip")
sha1sums=('010556e9792fd5d74f85af233afa2156f233122a')

package() {
  mkdir -p $pkgdir/usr/share/java/$pkgname
  install -Dm644 $srcdir/guice-$pkgver/*.jar $pkgdir/usr/share/java/$pkgname
  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  install -Dm644 $srcdir/guice-$pkgver/COPYING $pkgdir/usr/share/licenses/$pkgname
}

# Maintainer: Tomasz Żok <tomasz.zok [at] gmail.com>
pkgname=jfreechart
pkgver=1.0.15
pkgrel=1
pkgdesc="JFreeChart is a free 100% Java chart library that makes it easy for developers to display professional quality charts in their applications"
arch=(any)
url="http://www.jfree.org/jfreechart/"
license=('LGPL')
depends=(java-runtime)
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('e4caee37bbef63493bd73767d25594ab')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -d "$pkgdir/usr/share/java/$pkgname/"
  install lib/* "$pkgdir/usr/share/java/$pkgname/"
}

# vim:set ts=2 sw=2 et:

# Maintainer: Hilton Medeiros <medeiros.hilton at gmail dot com>

pkgname=compa-applet
_pkgname=compa
pkgver=0.98
pkgrel=1
pkgdesc="Command output monitor Gnome panel applet."
arch=('i686' 'x86_64')
url="http://compa.googlecode.com/"
license=('GPL2')
depends=('gnome-panel-bonobo')
source=(http://compa.googlecode.com/files/$_pkgname-$pkgver.tar.gz)
md5sums=('41af30b588d1d8d3a2d8a6afcdf3008e')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  ./configure --prefix=/usr --libexecdir=/usr/lib
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
  rm -fr "$pkgdir/usr/doc"
}

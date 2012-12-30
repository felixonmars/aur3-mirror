# Maintainer: TDY <tdy@gmx.com>

pkgname=gbirthday
pkgver=0.6.5
pkgrel=2
pkgdesc="A birthday reminder application"
arch=('i686' 'x86_64')
url="http://gbirthday.sourceforge.net/"
license=('GPL')
depends=('pygtk' 'python2-bsddb')
makedepends=('intltool')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('ae2058aafba773bb9062beb487313eb0')

package() {
  cd "$srcdir"
  make DESTDIR="$pkgdir" sitelib=/usr/lib/python2.7/site-packages install
}

#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=pacpal
pkgver=3.1
pkgrel=1
pkgdesc="A complementary tool to pacman for package management."
depends=('perl')
arch=('any')
license=('GPL')
url="http://xyne.archlinux.ca/info/${pkgname}"
source=(http://xyne.archlinux.ca/src/${pkgname}-${pkgver}.tar.gz)
md5sums=('28eb5de35241a8292eeecb09d7e9d459')

build() {
  install -D -m755 $srcdir/$pkgname/$pkgname $pkgdir/usr/bin/${pkgname}
  install -D -m644 $srcdir/$pkgname/man/$pkgname.1.gz $pkgdir/usr/share/man/man1/$pkgname.1.gz
}
# vim: set ts=2 sw=2 et:

#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=metapax
pkgver=3.0.1
pkgrel=3
pkgdesc="A metapackage maker to help organize, back up and migrate your packages."
depends=('perl')
arch=('any')
license=('GPL')
url="http://xyne.archlinux.ca/info/${pkgname}"
source=(http://xyne.archlinux.ca/src/${pkgname}-${pkgver}.tar.gz)
md5sums=('b0b1991672f40c0fcdd3e9c9002ca69c')

build() {
  install -D -m755 $srcdir/$pkgname/$pkgname $pkgdir/usr/bin/${pkgname}
  install -D -m644 $srcdir/$pkgname/man/$pkgname.1.gz $pkgdir/usr/share/man/man1/$pkgname.1.gz
}
# vim: set ts=2 sw=2 et:

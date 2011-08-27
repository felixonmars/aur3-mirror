# Maintainer: Trizen <trizenx at gmail dot com>

pkgname=perl-browser
pkgver=0.2
pkgrel=1
pkgdesc="A simple Perl browser based on Gtk2 Webkit."
arch=('any')
url="http://i55.tinypic.com/e63cs5.png"
license=('GPL')
depends=('perl-gtk2-webkit')
source=(http://trizen.go.ro/files/$pkgname)
md5sums=('fa46ec53571ef0d478ffc1fb983e2bc6')

build() {
  install -Dm 755 $srcdir/$pkgname $pkgdir/usr/bin/$pkgname
}

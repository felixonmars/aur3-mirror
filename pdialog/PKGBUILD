# Contributor: H.Gökhan SARI <hsa2@difuzyon.net>
pkgname=pdialog
pkgver=0.1
pkgrel=1
pkgdesc="pdialog is a simple python module that wraps Xdialog or dialog."
arch=('i686')
url="http://stromberg.dnsalias.org/~strombrg/pdialog.html"
license=('GPL')
depends=('python')
source=(http://stromberg.dnsalias.org/~strombrg/$pkgname.tar.gz)
md5sums=('42a224372a6bb9d74c2169a97d2e8390')

build() {
  cd "$srcdir/"

  mkdir -p $pkgdir/usr/lib/python2.6/site-packages/
  cp * $pkgdir/usr/lib/python2.6/site-packages/
}

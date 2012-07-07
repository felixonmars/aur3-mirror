# Contributor: kalio

pkgname=brandy
pkgver=1.0.19
pkgrel=1
pkgdesc="An interpreter for BBC Basic that runs under a variety of operating systems"
license=('GPL')
arch=('i686' 'x86_64')
url="http://jaguar.orpheusweb.co.uk/branpage.html"
depends=('glibc')
makedepends=('gcc')
source=(http://jaguar.orpheusweb.co.uk/brandy_119.tgz)
md5sums=('0aedef51e76cf07533d82fe4dcd89efa')

build () {
  cd $srcdir/$pkgname-$pkgver

  make || return 1

  mkdir -p $pkgdir/usr/bin
  mv $srcdir/$pkgname-$pkgver/brandy $pkgdir/usr/bin/
}

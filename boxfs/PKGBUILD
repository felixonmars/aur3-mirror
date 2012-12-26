# Maintainer: mmm
# Contributor: Greg Smith <gasmith@gmail.com>

pkgname=boxfs
pkgver=0.7
pkgrel=3
pkgdesc="A FUSE filesystem to access files on your box.net account"
arch=('i686' 'x86_64')
url="http://code.google.com/p/boxfs/"
license=('GPL')
depends=('fuse' 'libapp-git' 'libzip')
provides=('')
source=("http://boxfs.googlecode.com/files/boxfs-${pkgver}.tgz")
md5sums=('564e12f968168b46c49199c641b1f4ed')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p "$pkgdir/usr/bin"
  make PREFIX="$pkgdir/usr" install
}

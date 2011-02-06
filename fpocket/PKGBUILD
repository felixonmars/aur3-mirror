# Maintainer: Thomas Dziedzic < gostrc at gmail >
# Contributor: yescalona <yescalona at ug dot uchile dot com>

pkgname=fpocket
pkgver=1.0
pkgrel=2
pkgdesc='Protein pocket detection algorithm based on Voronoi tessellation.'
arch=('i686' 'x86_64')
url='http://fpocket.sourceforge.net'
license=('GPL')
depends=('glibc')
source=("http://downloads.sourceforge.net/project/fpocket/fpocket/$pkgname-src-$pkgver/$pkgname-src-$pkgver.tgz")
md5sums=('764b75372846a6bd2a8c52c957200ceb')

build() {
  cd $pkgname-src-$pkgver

  make || return 1

  make test || return 1

  make BINDIR="$pkgdir/usr/bin" MANDIR="$pkgdir/usr/share/man" install || return 1
}

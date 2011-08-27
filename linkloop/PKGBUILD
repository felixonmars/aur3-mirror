# Contributor: Nathan Owe <ndowens04 at gmail>
pkgname=linkloop
pkgver=0.0.3
pkgrel=1
pkgdesc="This program is similar to ping(1), but tests connectivity at the link layer (layer-2) instead of the network layer (layer-3)."
arch=('any')
url="http://savannah.nongnu.org/projects/linkloop"
license=('GPL')
depends=('glibc')
source=(http://savannah.inetbridge.net/linkloop/$pkgname-$pkgver.tar.gz)
md5sums=('05097a4a1e4080e957f9a3e35ae113c3') 

build() {
  cd $srcdir/$pkgname-$pkgver

  ./configure --prefix=/usr 
  make || return 1
  make prefix=/usr mandir=$pkgdir/usr/share/man bindir=$pkgdir/usr/bin/ install
}

# vim:set ts=2 sw=2 et:

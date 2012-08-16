# Contributor: Nicolas Quiénot < niQo at aur >

pkgname=utouch-frame
_pkgname=frame
pkgver=2.2.4
pkgrel=1
pkgdesc="Touch Frame Library"
arch=(i686 x86_64)
url="https://launchpad.net/utouch-frame"
license=(GPL)
depends=('evemu' 'libxi' 'mtdev' 'gcc-libs' 'libpciaccess' 'pixman')
makedepends=('xorg-server-devel' 'asciidoc')
source=(http://launchpad.net/$_pkgname/trunk/$pkgname-$pkgver/+download/$_pkgname-$pkgver.tar.gz)
options=('!libtool')

build() {
  cd $srcdir/$_pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
}

md5sums=('29977180754850bc40c0b29b2aff8561')

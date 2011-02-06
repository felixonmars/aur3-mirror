# Contributor: Alex <einfachnuralex> Predeschly <einfachnuralex_AT_gmx_DOT_net>
pkgname=libfusi
pkgver=0.0.8b1
pkgrel=1
arch=('i686')
pkgdesc="A management interface library for mounting, unmounting and remembering network-file-servers with FUSE"
url="http://www.scheinwelt.at/~norbertf/devel/fusi/"
license="GPL"
depends=('glib2')
makedepends=('gcc' 'make' 'glib2')
provides=()
conflicts=()
replaces=()
backup=()
install=
source=(http://www.scheinwelt.at/~norbertf/devel/fusi/files/$pkgname-$pkgver.tar.gz)
md5sums=('917d8e5493ec071ff4c15bc78c37761d')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc
  make || return 1
  make DESTDIR=$startdir/pkg install
}

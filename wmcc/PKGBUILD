# Contributor : Cédric Barboiron <ced@winkie.fr>
# Contributor : Julien Pecqueur <jpec@julienpecqueur.com>
pkgname=wmcc
pkgver=2.5.1g
pkgrel=2
pkgdesc="WMCoinCoin (updated version to work with new linuxfr.org board)"
arch=(i686 x86_64)
url="http://hules.free.fr/wmcoincoin/"
license=(GPLv2)
depends=(gtk2 imlib2)
makedepends=(pkgconfig)
provides=()
conflicts=()
replaces=()
backup=()
install=
source=(http://julienpecqueur.com/pkgs/wmcc-$pkgver.tar.gz)

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir install || return 1
  #make prefix=$startdir/pkg/usr install
}
md5sums=('ec6fccef41f7c128d43839775f4b9db6')

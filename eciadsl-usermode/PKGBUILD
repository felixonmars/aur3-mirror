# Contributor: gash <sbarbi at eccelinux.org>

pkgname=eciadsl-usermode
pkgver=0.12
pkgrel=1
pkgdesc="A free Linux driver for Globespan based ADSL USB modems."
url="http://eciadsl.flashtux.org/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('tk')
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(http://eciadsl.flashtux.org/download/$pkgname-$pkgver.tar.bz2  
        pusb-linux.diff 
        rc.adsl)
md5sums=('20cbf3b1e02262e25dae6ec697e5895e' \
         'aef3fadfa1a5fdefe171a69902d1336c' \
         'f70adbfa106b2f6a7ed0fef5569fcc6d')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  patch -p2 -i $startdir/pusb-linux.diff || return 1
  make || return 1
  make DESTDIR=$startdir/pkg install
  mkdir -p $startdir/pkg/etc/rc.d
  install -m755 $startdir/src/rc.adsl $startdir/pkg/etc/rc.d/eciadsl
}

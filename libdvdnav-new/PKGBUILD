# Contributor: Neoanima Xue <neoanima@gmail.com>
# Contributor: Zariel <c.bannister@gmail.com>

pkgname=libdvdnav-new
pkgver=4.1.3
pkgrel=3
pkgdesc="Library for easy use of DVD navigation"
arch=('i686' 'x86_64')
url="http://www.mplayerhq.hu/"
license=('GPL2')
depends=('glibc' 'libdvdread-new')
makedepends=()
provides=('libdvdnav=4.1.3')
conflicts=('libdvdnav' 'libdvdnav-svn')
source=(http://www8.mplayerhq.hu/MPlayer/releases/dvdnav/libdvdnav-$pkgver.tar.bz2)
md5sums=('d62383c45b28816771e283515f2c27fa')

build() {
  cd $srcdir/libdvdnav-$pkgver

  ./autogen.sh --prefix=/usr

  make || return 1
  make DESTDIR=$pkgdir install
}

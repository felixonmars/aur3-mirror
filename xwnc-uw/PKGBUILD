# Contributor: hpestilence <hpestilence@gmail.com>
pkgname=xwnc-uw
pkgver=0.3.3
pkgrel=1
pkgdesc="A virtual server from metisse modified by underware which is used for poker3d"
arch=('i686')
url="http://insitu.lri.fr/~chapuis/metisse"
license=('GPL')
depends=('zlib')
makedepends=('pkgconfig')
provides=('xwnc')
conflicts=('xwnc')
source=(http://download.gna.org/underware/sources/xwnc-$pkgver.tar.gz \
        http://poker3d-gentoo.googlecode.com/svn/trunk/x11-misc/xwnc/files/xwnc-0.3.3-r1.patch)
md5sums=('be38eb400d9e3fac38b3ce34250cf54e' '9613497c0c9eb72eab0fd6254e9429b6')

build() {
  cd $startdir/src/xwnc-$pkgver
  patch -Np1 -i ../xwnc-0.3.3-r1.patch || return 1
  autoreconf -f -i
  ./configure --prefix=/usr --disable-glx --without-fvwm-ametista
  make || return 1
  make DESTDIR=$startdir/pkg install
}

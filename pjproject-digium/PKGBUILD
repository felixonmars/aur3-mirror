# Maintainer: Xavier Devlamynck <magicrhesus@ouranos.be>
# Contributor: Marti Raudsepp <marti@juffo.org>
#Contributor: Travis Hegner <travis.hegner@gmail.com>

pkgname=pjproject-digium
pkgver=2.1.digium1.r22.g217740d
pkgrel=1
pkgdesc="Open source SIP stack and media stack (Digium version)"
arch=('i686' 'x86_64')
url="http://www.pjsip.org/"
license=('GPL')
depends=('openssl' 'util-linux-ng')
makedepends=('e2fsprogs')
conflicts=('pjproject')
source=("${pkgname}"::git+https://github.com/asterisk/pjproject)
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g' | sed 's/pjproject.//g'
}

build() {
  cd "${srcdir}/${pkgname}"
  #export CXXFLAGS="${CXXFLAGS} -fPIC"
  #export CFLAGS="${CXXFLAGS}"
  ./configure --prefix=/usr --enable-shared --disable-sound --disable-resample --disable-video --disable-opencore-amr --disable-speex-codec --disable-speex-aec
  make -j1 dep 
  make -j1 
}

package() {
  cd "${srcdir}/${pkgname}"
  make -j1 DESTDIR=${pkgdir} install
}

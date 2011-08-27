# Maintainer: kevku <kevku@msn.com>
# Contributor: Hasee Wu <hasee.wu@gmail.com>
# Contributor:  midoriumi <gs@bbxy.net>
pkgname=amule-dlp
pkgver=2.2.6
_dlpver=DLP4401
_ver=${pkgver}-${_dlpver}
pkgrel=2
pkgdesc="An eMule-like client for ed2k p2p network with DLP patch enhanced by Bill Lee"
arch=('i686' 'x86_64')
url="http://code.google.com/p/amule-dlp/"
license=('GPL')
depends=('wxgtk' 'gd' 'geoip' 'libupnp' 'crypto++' 'libsm')
conflicts=('amule')
provides=('amule=${pkgver}')
source=(http://amule-dlp.googlecode.com/files/aMule-${_ver}.tar.bz2)
md5sums=('88696f9d68f12ba589b8a683297a768e')

build() {
  cd "${srcdir}/aMule-${pkgver}"

  ./configure --prefix=/usr \
    --mandir=/usr/share/man \
    --enable-cas \
    --enable-upnp \
    --enable-geoip \
    --enable-ccache \
    --enable-optimize \
    --enable-webserver \
    --enable-alc \
    --enable-alcc \
    --enable-wxcas \
    --disable-debug \
    --enable-amulecmd \
    --enable-amule-gui \
    --enable-amule-daemon

  make
}

package() {
  cd "${srcdir}/aMule-${pkgver}"

  make DESTDIR=${pkgdir}/ install
}

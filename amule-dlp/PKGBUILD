# Maintainer:  cuihao <cuihao dot leo at gmail dot com>
# Contributor: kevku <kevku@msn.com>
# Contributor: Hasee Wu <hasee.wu@gmail.com>
# Contributor: midoriumi <gs@bbxy.net>

pkgname=amule-dlp
pkgver=2.3.1rc1
_dlpver=DLP4401
pkgrel=2
pkgdesc="An eMule-like client for ed2k p2p network with DLP patch enhanced by Bill Lee"
arch=('i686' 'x86_64')
url="http://code.google.com/p/amule-dlp/"
license=('GPL')
depends=('wxgtk' 'gd' 'geoip' 'libupnp' 'crypto++' 'libsm')
conflicts=('amule')
provides=('amule=${pkgver}')
source=("http://downloads.sourceforge.net/project/amule/aMule/${pkgver}/aMule-${pkgver}.tar.bz2"
        "https://amule-dlp.googlecode.com/files/aMule-${pkgver}-${_dlpver}.patch"
        'ftbfs-gcc-4.7.diff')
sha1sums=('f43ae7f9bbd48925a2fb918ce6bd5a39a2e8c782'
          '140c8ea0c2e95d8582f861a9dd140f7295a5c95b'
          '34b3525a3ede765b396782f47e5fe7a54f70ca06')

build() {
  cd "${srcdir}/aMule-${pkgver}"

  patch -Np1 -i "../aMule-${pkgver}-${_dlpver}.patch"
  patch -Np1 -i "../ftbfs-gcc-4.7.diff"
  ./configure --prefix=/usr \
    --mandir=/usr/share/man \
    --enable-cas \
    --enable-upnp \
    --enable-geoip \
    --enable-ccache \
    --enable-optimize \
    --disable-webserver \
    --enable-alc \
    --enable-alcc \
    --enable-wxcas \
    --disable-debug \
    --enable-amulecmd \
    --enable-amule-gui \
    --enable-amule-daemon \
    --enable-nls \
    --enable-mmap

  make
}

package() {
  cd "${srcdir}/aMule-${pkgver}"
  make DESTDIR=${pkgdir}/ install
}

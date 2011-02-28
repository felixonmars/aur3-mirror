# Maintainer: kevku <kevku@msn.com>
# Contributor: Hasee Wu <hasee.wu@gmail.com>
# Contributor:  midoriumi <gs@bbxy.net>
pkgname=amule-dlp
pkgver=2.2.6_DLP4302
pkgrel=1
pkgdesc="An eMule-like client for ed2k p2p network with DLP patch enhanced by Bill Lee"
arch=('i686' 'x86_64')
url="http://code.google.com/p/amule-dlp/"
license=('GPL')
depends=('wxgtk' 'gd' 'geoip' 'libupnp')
makedepends=('crypto++')
conflicts=('amule')
provides=('amule=2.2.6')
source=("http://amule-dlp.googlecode.com/files/aMule-2.2.6-DLP4302.tar.bz2")
md5sums=('8b295fdcab60519f8e1fcd4c266acb46')

build() {
  cd "${srcdir}/aMule-2.2.6-DLP4302"
    ./configure --prefix=/usr \
		--mandir=/usr/share/man \
		--enable-cas \
		--enable-wxcas \
		--enable-amule-daemon \
		--enable-amulecmd \
		--enable-amule-gui \
		--enable-alc \
		--enable-alcc \
		--enable-webserver \
		--disable-debug \
		--enable-optimize \
		--enable-ccache \
		--enable-geoip \
		--enable-upnp
    make
}

package(){
  cd "${srcdir}/aMule-2.2.6-DLP4302"
    make DESTDIR=${pkgdir}/ install
}

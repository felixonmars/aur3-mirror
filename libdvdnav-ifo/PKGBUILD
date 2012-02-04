# Contributor: hydro <hydro@freenet.de>

pkgname=libdvdnav-ifo
pkgver=0.1.10
pkgrel=2
pkgdesc="provides playback of DVDs with defective UDF file system"
arch=('i686')
license=('GPL')
url="http://tobias.rautenkranz.ch/libdvdread_ifo.html"
depends=()
options=(!libtool)
source=(http://tobias.rautenkranz.ch/debian/etch/libdvdnav_$pkgver-0.2-3.tar.gz)

md5sums=('7d56b8391c210688d4a88183e678653b')
conflicts=('libdvdnav')
provides=('libdvdnav')
build() {
  cd ${startdir}/src/libdvdnav-${pkgver}-0.2
  ./autogen.sh --prefix=/usr || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}

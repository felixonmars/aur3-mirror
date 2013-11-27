# Maintaner: PelPix <kylebloss[at]pelpix.info>
# Contributor: DrZaius <lou[at]fakeoutdoorsman[dot]com>

pkgname=libfdk-aac
pkgver=0.1.3
pkgrel=1
pkgdesc="Fraunhofer FDK AAC codec library"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/opencore-amr/"
license=('custom')
depends=('glibc')
provides=('libfdk-aac')
conflicts=('libfdk-aac-git')
options=('!emptydirs' '!libtool')
source=(http://downloads.sourceforge.net/opencore-amr/fdk-aac-${pkgver}.tar.gz)
md5sums=('6b3b70faa3108b7a00f7740b3de38b83')

build() {
  cd "${srcdir}/fdk-aac-${pkgver}"
  ./configure --prefix=/usr
  make
}

package () {
  cd "${srcdir}/fdk-aac-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 NOTICE "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
}

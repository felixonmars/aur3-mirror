# Contributor: zoulnix <http://goo.gl/HQaP>
pkgname=drumroll
pkgver=11.0
pkgrel=4
pkgdesc="Play a Dream Cheeky USB Roll-Up Drum Kit on Linux."
arch=('i686' 'x86_64')
url="http://drumroll.sourceforge.net/"
license=('GPL')
depends=('jack' 'libfakekey' 'libusb' 'sdl_mixer')
makedepends=('gcc' 'make' 'pkg-config')
options=('!libtool')
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.bz2)
md5sums=('08f591e369592890ed8a77670f1406b3')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  # **sampledir**
  sed -i -e 's: $(pkgdatadir): $(DESTDIR)$(pkgdatadir):' Makefile.* || return 1

  ./configure --prefix=/usr \
	      --sysconfdir=/etc \
	      --localstatedir=/var \
	      --disable-static

  make || return 1
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  install -d ${pkgdir}/usr/share/${pkgname} || return 1

  make DESTDIR=${pkgdir} install || return 1

  # Removing unnecessary stuff
  find ${pkgdir} -depth -type d -name ".svn" -exec rm -rf {} \;
}

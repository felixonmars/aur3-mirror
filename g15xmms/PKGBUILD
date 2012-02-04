# Contributor: zoulnix <http://goo.gl/HQaP>
pkgname=g15xmms
pkgver=2.5.4
pkgrel=3
pkgdesc="A very simple spectrum analyser for xmms."
arch=('i686' 'x86_64')
url="http://www.g15tools.com/"
license=('GPL')
depends=('g15daemon' 'xmms')
makedepends=('autoconf' 'automake' 'gcc' 'libtool' 'make' 'pkg-config')
options=('!libtool')
source=(http://downloads.sourceforge.net/g15daemon/g15daemon-xmms-${pkgver}.tar.bz2)
md5sums=('818bd22f97eaa916a47f20a39fbb313a')

build() {
  cd ${srcdir}/g15daemon-xmms-${pkgver}

  # Generating build system
  ./autogen.sh || return 1

  ./configure --prefix=/usr \
	      --sysconfdir=/etc \
	      --localstatedir=/var \
	      --disable-static

  make || return 1
}

package() {
  cd ${srcdir}/g15daemon-xmms-${pkgver}

  make DESTDIR=${pkgdir} install || return 1
}

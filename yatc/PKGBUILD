# Contributor: zoulnix <http://goo.gl/HQaP>
pkgname=yatc
pkgver=0.3.2
pkgrel=2
pkgdesc="A client for any game that uses Tibia-compatible protocol."
arch=('i686' 'x86_64')
url="http://yatc.vucica.net/"
license=('GPL')
depends=('sdl_gfx' 'gmp' 'glict-svn>=105')
makedepends=('gcc' 'imagemagick' 'make' 'pkg-config')
options=('!libtool')
source=(http://ivan.vucica.net/yatc/src/${pkgname}-${pkgver}.tar.gz \
	${pkgname}.desktop)
md5sums=('96f23e92ebd47814719b447f19f9849a' 'e5ac284f6013e9b541b440f563334323')

build() { 
  cd ${srcdir}/${pkgname}-${pkgver}

  ./configure --prefix=/usr \
	      --sysconfdir=/etc \
	      --localstatedir=/var \
	      --disable-static

  make || return 1
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  install -d ${pkgdir}/usr/share/{applications,pixmaps} || return 1

  make DESTDIR=${pkgdir} install || return 1

  install -m644 ${startdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/ || return 1
  install -m644 ${pkgname}.ico.png ${pkgdir}/usr/share/pixmaps/ || return 1
}

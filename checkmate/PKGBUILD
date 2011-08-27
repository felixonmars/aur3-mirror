# Contributor: zoulnix <http://goo.gl/HQaP>
pkgname=checkmate
pkgver=0.2.1
pkgrel=1
pkgdesc="A simple, lightweight, multi-platform chess game."
arch=('i686' 'x86_64')
url="http://code.google.com/p/checkmate-chess/"
license=('GPL')
depends=('sdl_image')
makedepends=('gcc' 'make' 'pkg-config')
source=(http://checkmate-chess.googlecode.com/files/${pkgname}-${pkgver}-src.tar.gz \
	${pkgname}.desktop \
	logo.png)
md5sums=('fa5a250931a20dfed98ed40ca3f5e371' 'c4ddbed4e9b77ccb0fe0d80e5dc2d2a0' \
	 '3ae8ed791d4c35fd39b627c443a7b46f')

build() { 
  cd ${srcdir}/${pkgname}

  # Change image rootdir
  sed -i -e 's:pixmaps:\/usr\/share\/checkmate\/images:' src/images.cpp || return 1

  make -f Makefile.linux || return 1
}

package() {
  cd ${srcdir}/${pkgname}
  install -d ${pkgdir}/usr/share/{applications,pixmaps,${pkgname}/images} \
	     ${pkgdir}/usr/bin || return 1

  install -m755 ${pkgname} ${pkgdir}/usr/bin/ || return 1
  install -m644 pixmaps/*.png ${pkgdir}/usr/share/${pkgname}/images/ || return 1
  install -m644 ${startdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/ || return 1
  install -m644 ${startdir}/logo.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png || return 1
}

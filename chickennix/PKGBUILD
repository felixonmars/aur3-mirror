# Contributor: Micael Soder <zoulnix|at|gmail|dot|com>
pkgname=chickennix
pkgver=0.1
pkgrel=1
pkgdesc="A 2-D shoot\'em up game."
arch=('i686' 'x86_64')
url="http://chickennix.sourceforge.net/"
license=('GPL')
depends=('sdl_image' 'sdl_mixer')
makedepends=('gcc' 'make' 'patch' 'pkgconfig' 'sed')
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}_src.tar \
	${pkgname}-makefile.patch)
md5sums=('2ddda6ce43a335242d762b887d2aa4d8' '984887b679fef1ce6d4c8f95205960df')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  # Applying Patch*
  patch -Np1 -i ../${pkgname}-makefile.patch || return 1

  sed -i -e 's:share/games:share:g' src/defines.h || return 1

  make || return 1
  make DESTDIR=${pkgdir} install || return 1
}
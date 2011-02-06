# Contributor: zoulnix <http://goo.gl/HQaP>
pkgname=bjs
pkgver=0.1.3
pkgrel=2
pkgdesc="Arcade tank battle in 3D."
arch=('i686' 'x86_64')
url="http://bjs.sourceforge.net/"
license=('GPL')
depends=('cegui' 'lua' 'omniorb' 'openal' 'sdl_image' \
	 'sdl_mixer' 'sdl_ttf' 'ttf-dejavu' 'ttf-freefont')
makedepends=('gcc' 'make' 'patch' 'pkg-config')
options=('!libtool')
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz \
	${pkgname}-mkfix.diff)
md5sums=('1d6d1d850335fe5ec98fcdc432a54606' 'f6211a663bb72aea4eec129d61ea5702')

build() { 
  cd ${srcdir}/${pkgname}-${pkgver}

  # apply some patches...
  patch -Np1 -i ${startdir}/${pkgname}-mkfix.diff || return 1

  make || return 1
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  make DESTDIR=${pkgdir}/usr install || return 1

  # symlink fonts...
  rm ${pkgdir}/usr/share/${pkgname}/data/*.tt*
  ln -s /usr/share/fonts/TTF/DejaVuSansCondensed.ttf ${pkgdir}/usr/share/${pkgname}/data/ || return 1
  ln -s /usr/share/fonts/TTF/DejaVuSansCondensed-Bold.ttf ${pkgdir}/usr/share/${pkgname}/data/ || return 1
  ln -s /usr/share/fonts/TTF/FreeMono.ttf ${pkgdir}/usr/share/${pkgname}/data/ || return 1
}

# Maintainer:   Nathan O <ndowens.aur at gmail dot com>
#
pkgname=agar
pkgver=1.4.1
pkgrel=1
pkgdesc="Modern cross-platform toolkit for graphical applications 
implemented in C, C++ and Ada"
arch=('i686' 'x86_64')
url="http://libagar.org"
license=('BSD')
depends=('sh')
optdepends=('sdl: If you want to use the sdlfb or sdlgl'
            'freetype2: Improve Font Rendering')
options=('!emptydirs' '!libtool')
source=(http://stable.hypertriton.com/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('ce71fb11ad79c926a968a4ed29053820')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -d ${pkgdir}/usr/{share/licenses/${pkgname},bin,lib/${pkgname}} 
  ./configure --prefix=/usr \
	  --enable-network \
	  --bindir=/usr/bin/	\
	  --libdir=/usr/lib/${pkgname} \
	  --infodir=/usr/share/info \
	  --sharedir=/usr/share

  make 
  }
  package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make  DESTDIR="${pkgdir}" MANDIR=/usr/share/man install
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

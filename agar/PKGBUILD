# Maintainer:   Nathan O <ndowens.aur at gmail dot com>
pkgname=agar
pkgver=1.4.0
pkgrel=3
pkgdesc="Modern cross-platform toolkit for graphical applications 
implemented in C, C++ and Ada"
arch=('i686')
url="http://libagar.org"
license=('BSD')
optdepends=('sdl: If you want to use the sdlfb or sdlgl'
            'freetype2: Improve Font Rendering')
options=(!emptydirs !libtool)
source=(http://stable.hypertriton.com/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('4259d53536d33f93268493ac499df927')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -d ${pkgdir}/usr/{share/licenses/${pkgname},bin,lib/${pkgname}} 
  ./configure --prefix=/usr --enable-network --bindir=/usr/bin/ --libdir=/usr/lib/${pkgname} --infodir=/usr/share/info --sharedir=/usr/share 

  make 
  make  DESTDIR="${pkgdir}"  install
  install -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/
}

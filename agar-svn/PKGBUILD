# Maintainer:   Andrea Agosti <cifvts at gmail dot com>
# Contributor:  josephgbr

pkgname=agar-svn
pkgver=9500
pkgrel=1
pkgdesc="Modern cross-platform toolkit for graphical applications 
implemented in C, C++ and Ada - svn"
arch=('i686' 'x86_64')
url="http://libagar.org"
license=('BSD')
depends=('sh')
optdepends=('sdl: If you want to use the sdlfb or sdlgl'
            'freetype2: Improve Font Rendering')
options=('!emptydirs' '!libtool')
source=()
md5sums=()
makedepends=('subversion')
provides=('agar')
conflicts=('agar')

_svntrunk=http://dev.hypertriton.com/agar/trunk
_svnmod=trunk
_svnname=agar

build() {
  msg "Starting SVN checkout..."
  cd ${srcdir}
    if [ -d $_svnmod/.svn ]; then
      (cd $_svnmod && svn up)
    else
      svn co $_svntrunk $_svnmod
    fi
  msg "SVN checkout done or server timeout"

  cd "${srcdir}/${_svnmod}"
  install -d ${pkgdir}/usr/{share/licenses/${_svnname},bin,lib/${_svnname}} 
  ./configure --prefix=/usr \
	  --bindir=/usr/bin/	\
	  --libdir=/usr/lib/${_svnname} \
	  --infodir=/usr/share/info \
	  --datadir=/usr/share \
	  --with-gl=/usr

  make 
  }
package() {
  cd "${srcdir}/${_svnmod}"
  msg "make  DESTDIR="${pkgdir}" MANDIR=/usr/share/man install"
  mkdir -p ${pkgdir}/usr/share/agar/fonts
  make  DESTDIR="${pkgdir}" MANDIR=/usr/share/man install
  msg "install -Dm644 ada-core/LICENSE ${pkgdir}/usr/share/licenses/${_svnname}/LICENSE"
  install -Dm644 ada-core/LICENSE ${pkgdir}/usr/share/licenses/${_svnname}/LICENSE
}

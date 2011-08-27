# Maintainer: Ricardo Hernandez <richerve@archlinux.com.ve>

pkgname=scribus-stable
_realname=scribus
pkgver=1.3.3.14
pkgrel=2
pkgdesc="A desktop publishing program. Stable version"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.scribus.net"
install=scribus.install
depends=('libcups>=1.3.11' 'lcms>=1.18' 'qt3>=3.3.8' 'ghostscript>=8.60' \
         'libart-lgpl>=2.3.10' 'python>=2.3' 'libxml2>=2.6.0' 'cairo' \
         'desktop-file-utils' 'shared-mime-info' 'freetype2>=2.1.3' 'libtiff>=3.6.0')
makedepends=('cmake')
provides='scribus'
conflicts='scribus' 
options=(!libtool !makeflags)
source=(http://downloads.sourceforge.net/sourceforge/${_realname}/${_realname}-${pkgver}.tar.bz2)

build() {
  cd ${srcdir}/${_realname}-${pkgver}
  cmake . -DCMAKE_INSTALL_PREFIX:PATH=/usr \
          -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_SKIP_RPATH=ON \
	  -DWANT_CAIRO=1 -DLIB_SUFFIX="" 
  make || return 1
  make DESTDIR=${pkgdir} install

  # fix icon path in .desktop file
  sed -i 's|Icon=scribus|Icon=/usr/share/scribus/icons/scribus.png|' vnd.scribus.desktop
  #sed -i 's|GenericName=Page Layout (Development)|GenericName=Page Layout (Stable)|' vnd.scribus.desktop

  install -Dm644 vnd.scribus.desktop \
  ${pkgdir}/usr/share/applications/scribus.desktop

}
md5sums=('347f9dd7f9e1924218c5975811abf05a')

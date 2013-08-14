# Maintainer: Dany Martineau <dany.luc.martineau@gmail.com>

pkgname=kde4-kcemirror
pkgver=0.2
pkgrel=1
pkgdesc="Remote control of Windows CE devices in the manner of VNC."
arch=('i686' 'x86_64')
url="http://synce.sourceforge.net/"
license=('GPL')
depends=('synce-core')
makedepends=('cmake' 'automoc4')
options=('!libtool')
source=(http://downloads.sourceforge.net/sourceforge/synce/SynCE-KDE/${pkgname}/${pkgname}-$pkgver.tar.gz)
md5sums=('177afafa0e1ec6b7f9e60b5d3514feb3')

build() {
  cd ${srcdir}
  if [ -d build ]; then
	  rm -rf build
  fi
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ../${pkgname}-${pkgver}
  make
}

package() {
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install
}

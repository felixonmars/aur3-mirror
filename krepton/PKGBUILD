
pkgname=krepton
pkgver=4.4
pkgrel=2
pkgdesc="The classic Repton 3 game on the KDE desktop"
arch=('i686' 'x86_64')
url="https://opendesktop.org/content/show.php/KRepton?content=12882"
license=('GPL')
depends=('qt4' 'kdelibs')
makedepends=('cmake' 'automoc4' 'kdebase-runtime')
options=('!libtool')
source=(http://www.keelhaul.me.uk/krepton/downloads/${pkgname}-${pkgver}.tar.gz)
sha256sums=('cb3045e6b703d3bd1bb860a246ef0fc616737a556ec5f85759ac4198c16378c3')
_buildir=build
install=$pkgname.install

build() {
  cd "${srcdir}"
       if [ -d "$_buildir" ]; then
		msg 'Cleaning previous build...'
		rm -rf "$_buildir"
	fi
  mkdir build
  cd build

  cmake "../${pkgname}-${pkgver}" -DCMAKE_INSTALL_PREFIX=$(kde4-config --prefix) \
  -DLIB_INSTALL_DIR=/usr/lib \
  -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:

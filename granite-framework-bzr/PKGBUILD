# Maintainer: Vasco Nunes <vascomfnunes at gmail dot com>

pkgname=granite-framework-bzr
pkgver=563
pkgrel=1
pkgdesc="An extension of GTK+ libraries"
arch=('i686' 'x86_64')
url="https://launchpad.net/granite"
license=('GPL3')
depends=('gtk3' 'hicolor-icon-theme' 'libgee06')
makedepends=('bzr' 'cmake' 'gobject-introspection' 'vala')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
install=${pkgname%-*}.install

_bzrtrunk=lp:granite
_bzrmod=granite

build() {
  msg "Connecting to Bazaar server...."

  if [ -d $_bzrmod ]; then
    cd $_bzrmod && bzr pull $_bzrtrunk -r $pkgver && cd ..
    msg "The local files are updated."
  else
    bzr branch $_bzrtrunk $_bzrmod -r $pkgver
  fi

  msg "BZR checkout done or server timeout"
  msg "Starting make..."

  [ -d $_bzrmod-build ] && rm -rf $_bzrmod-build
  cp -r $_bzrmod $_bzrmod-build
  cd $_bzrmod-build

  [ -d build ] && rm -rf build
  mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DGSETTINGS_COMPILE=OFF
  make ${MAKEFLAGS}
}

package() {
  cd "$srcdir/$_bzrmod-build/build"
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="$pkgdir/" install
}

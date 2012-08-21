# Maintainer: Ner0

pkgname=maya-bzr
pkgver=342
pkgrel=1
pkgdesc="Calendar application written in Vala from the Elementary project"
arch=('i686' 'x86_64')
url="https://launchpad.net/maya"
license=('GPL3')
depends=('evolution-data-server' 'gobject-introspection' 'glib2' 'cairo'
         'gtk3' 'granite-bzr' 'libical' 'libgee' 'dconf' 'desktop-file-utils')
makedepends=('bzr' 'vala' 'cmake' 'pkg-config')
optdepends=('contractor-bzr: Contractor integration [AUR]')
install=$pkgname.install

_bzrtrunk=lp:maya
_bzrmod=maya

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
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DGSETTINGS_COMPILE=OFF -DGSETTINGS_LOCALINSTALL=OFF
  make ${MAKEFLAGS}
}

package() {
  cd "$srcdir/$_bzrmod-build/build"
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="$pkgdir/" install
}

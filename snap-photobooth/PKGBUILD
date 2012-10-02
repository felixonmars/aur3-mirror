# Contributor : Roberto Scinocca

pkgname=snap-photobooth
pkgver=110
pkgrel=1
pkgdesc="Webcam software of elementary os"
arch=(i686 x86_64)
url="https://code.launchpad.net/~elementary-apps/snap-elementary/snap"
license=(GPL)
depends=(gtk3 cheese gnome-desktop granite-bzr gstreamer0.10 glib-networking clutter glibc glib2 libgee glib-perl)
makedepends=(bzr vala cmake)

_bzrtrunk=lp:snap-elementary
_bzrmod=snap-elementary

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
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make
}
package() {
  cd "$srcdir/$_bzrmod-build/build"
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="$pkgdir/" install
}

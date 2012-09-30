# Contributor : Roberto Scinocca

pkgname=dynamic-gcc-plug-bzr
pkgver=28
pkgrel=1
pkgdesc="Gnome control center plug for Switchboard"
arch=(i686 x86_64)
url="https://code.launchpad.net/~elementary-apps/pantheon-plugs/dynamic-gcc-plug"
license=(GPL)
depends=(switchboard-bzr gtk3 glib-networking gnome-desktop glibc)
makedepends=(bzr vala cmake)

_bzrtrunk=lp:~elementary-apps/pantheon-plugs/dynamic-gcc-plug
_bzrmod=dynamic-gcc-plug

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
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_EXE_LINKER_FLAGS="$CFLAGS -lm"
  make
}
package() {
  cd "$srcdir/$_bzrmod-build/build"
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="$pkgdir/" install
}

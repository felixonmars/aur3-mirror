# Submitter: schuay <jakob.gruber@gmail.com>
# Maintainer: Ner0

pkgname=beatbox-bzr
pkgver=667
pkgrel=1
pkgdesc="A music player with focus on speed, simplicity and music discovery"
arch=('i686' 'x86_64')
url="https://launchpad.net/beat-box"
license=('GPL3')
depends=('glib2' 'gtk3' 'libgee' 'gstreamer0.10' 'gstreamer0.10-base' 'clutter-gtk'
         'taglib' 'hicolor-icon-theme' 'libxml2' 'gconf' 'libnotify' 'desktop-file-utils'
         'libsoup' 'json-glib' 'granite-bzr' 'sqlheavy' 'dconf' 'libgpod' 'gtk-update-icon-cache')
makedepends=('bzr' 'vala' 'cmake' 'gettext')
optdepends=('libzeitgeist' 'libdbusmenu' 'libindicate')
install=$pkgname.install

_bzrtrunk=lp:beat-box
_bzrmod=beat-box

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

  #sed -i 's/sqlheavy-0.1/sqlheavy-0.2/' CMakeLists.txt vapi/CMakeLists.txt
  #sed -i '/private BeatBox.UnityIntegration unity;/d' src/Core/LibraryWindow.vala
  #cp vapi/sqlheavy-0.1.vapi vapi/sqlheavy-0.2.vapi

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

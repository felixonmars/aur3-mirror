# $Id$
# Foked by: Cedric Bellegarde <gnumdk@gmail.com>
# Maintainer: Maxime Gauduin <alucryd@gmail.com>
# Contributor : sebikul <sebikul@gmail.com>
# Contributor : Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=geary-unity
pkgver=0.10.0-1
pkgrel=1
pkgdesc='A lightweight email client for the GNOME/Unity desktop'
arch=('i686' 'x86_64')
url='https://launchpad.net/geary'
license=('GPL3')
groups=('gnome' 'unity')
depends=('gmime' 'gnome-keyring' 'libcanberra' 'libgee' 'libnotify' 'librsvg' 'webkitgtk' 'libunity' 'dee-bzr')
makedepends=('bzr' 'cmake' 'gnome-doc-utils' 'gobject-introspection' 'intltool' 'vala')
provides=('geary-unity')
conflicts=('geary' 'geary-git' 'geary-devel')
install='geary.install'
source=('geary::bzr+http://bazaar.launchpad.net/~yorba/geary/trunk/')
sha256sums=('SKIP')

pkgver() {
  cd geary

  echo "r$(bzr revno)"
}

build() {
  cd geary

  ./configure \
    --prefix='/usr' 
  make
}

package() {
  cd geary

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:

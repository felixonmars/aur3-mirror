# Maintainer : speps <speps at aur dot archlinux dot org>

pkgname=distrho-dssi-git
pkgver=r705.9a43273
pkgrel=1
pkgdesc="Distrho DSSI Audio Plugins, using the JUCE Toolkit"
arch=('i686' 'x86_64')
url="http://distrho.sourceforge.net/"
license=('GPL' 'GPL3' 'LGPL')
depends=('dssi' 'libgl')
makedepends=('premake3' 'jack' 'libxinerama'
             'libxrender' 'libxcursor' 'qt4')
optdepends=('jack: jack audio support')
provides=('distrho-dssi' 'distrho-plugins')
conflicts=('distrho-dssi' 'distrho-plugins-dssi-git')
replaces=('distrho-plugins-dssi-git')
source=("$pkgname::git+https://github.com/falkTX/DISTRHO.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  echo r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd $pkgname

  # generate build script
  scripts/premake-update.sh linux
}

build() {
  cd $pkgname
  make dssi
}

package() {
  cd $pkgname

  # dssi plugins
  install -d "$pkgdir/usr/lib/dssi"
  cp -a bin/dssi/* "$pkgdir/usr/lib/dssi"
}

# vim:set ts=2 sw=2 et:

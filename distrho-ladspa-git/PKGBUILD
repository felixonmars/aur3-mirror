# Maintainer : speps <speps at aur dot archlinux dot org>

pkgname=distrho-ladspa-git
pkgver=r705.9a43273
pkgrel=1
pkgdesc="Distrho LADSPA Audio Plugins, using the JUCE Toolkit"
arch=('i686' 'x86_64')
url="http://distrho.sourceforge.net/"
license=('GPL' 'GPL3' 'LGPL')
depends=('ladspa')
makedepends=('premake3' 'jack' 'libxinerama'
             'libxrender' 'libxcursor' 'qt4')
optdepends=('jack: jack audio support')
provides=('distrho-ladspa' 'distrho-plugins')
conflicts=('distrho-ladspa' 'distrho-plugins-ladspa-git')
replaces=('distrho-plugins-ladspa-git')
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
  make ladspa
}

package() {
  cd $pkgname

  # ladspa plugins
  install -d "$pkgdir/usr/lib/ladspa"
  cp -a bin/ladspa/* "$pkgdir/usr/lib/ladspa"
}

# vim:set ts=2 sw=2 et:

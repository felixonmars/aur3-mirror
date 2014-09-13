# Maintainer : speps <speps at aur dot archlinux dot org>

pkgname=distrho-lv2-git
pkgver=r196.f0706a8
pkgrel=1
pkgdesc="Distrho LV2 Audio Plugins, using the JUCE Toolkit"
arch=('i686' 'x86_64')
url="http://distrho.sourceforge.net/"
license=('GPL' 'GPL3' 'LGPL')
depends=('lv2' 'libxext')
makedepends=('git' 'premake3' 'jack' 'libxinerama'
             'libxrender' 'libxcursor' 'freetype2')
#             'csound')
optdepends=('jack: jack audio support')
#            'csound: cabbage plugins')
provides=('distrho-lv2' 'distrho-plugins')
conflicts=('distrho-lv2' 'distrho-plugins-lv2-git')
replaces=('distrho-plugins-lv2-git')
source=("$pkgname::git+https://github.com/DISTRHO/DISTRHO-Ports.git")
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
  make lv2
}

package() {
  cd $pkgname

  # lv2 plugins
  install -d "$pkgdir/usr/lib/lv2"
  cp -a bin/lv2/*.lv2 \
    "$pkgdir/usr/lib/lv2"
}

# vim:set ts=2 sw=2 et:

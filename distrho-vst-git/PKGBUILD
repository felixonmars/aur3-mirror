# Maintainer : speps <speps at aur dot archlinux dot org>

pkgname=distrho-vst-git
pkgver=r196.f0706a8
pkgrel=1
pkgdesc="Distrho VST Audio Plugins, using the JUCE Toolkit"
arch=('i686' 'x86_64')
url="http://distrho.sourceforge.net/"
license=('GPL' 'GPL3' 'LGPL')
depends=('libxext')
makedepends=('premake3' 'jack' 'libxinerama'
             'libxrender' 'libxcursor')
#             'csound')
optdepends=('jack: jack audio support')
#            'csound: cabbage plugins')
provides=('distrho-vst' 'distrho-plugins')
conflicts=('distrho-vst' 'distrho-plugins-vst-git')
replaces=('distrho-plugins-vst-git')
source=("$pkgname::git+https://github.com/DISTRHO/DISTRHO-ports.git"
        "vst_sdk2_4_rev2.zip")
noextract=("${source[1]}")
md5sums=('SKIP'
         'b4b496306a95e422ccffd0e73b87a870')

pkgver() {
  cd $pkgname
  echo r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd $pkgname

  # placing the vst sdk
  unzip "$srcdir/${source[1]}" -d sdks

  # generate build script
  scripts/premake-update.sh linux
}

build() {
  cd $pkgname
  make vst
}

package() {
  cd $pkgname

  # vst plugins
  install -d "$pkgdir/usr/lib/vst"
  cp -a bin/vst/* "$pkgdir/usr/lib/vst"
}

# vim:set ts=2 sw=2 et:

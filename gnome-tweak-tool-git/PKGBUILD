# $Id$
# Submitter: Alexandre Guimarães <alexandre.cortes AT hotmail dot fr>

pkgname=gnome-tweak-tool-git
pkgver=9999
pkgrel=2
pkgdesc="A tool to customize advanced GNOME 3 options."
arch=(any)
url="https://live.gnome.org/GnomeTweakTool"
license=('GPL')
depends=('gnome-settings-daemon' 'python2-gobject' 'gnome-common')
makedepends=('intltool')
conflicts=('gnome-tweak-tool')
source=()
md5sums=()

build() {
  git clone http://git.gnome.org/browse/gnome-tweak-tool 
  cd "gnome-tweak-tool"

  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "gnome-tweak-tool"

  make DESTDIR="$pkgdir" install
  sed -i "s|#!/usr/bin/env python|#!/usr/bin/env python2|" "$pkgdir"/usr/bin/gnome-tweak-tool
}


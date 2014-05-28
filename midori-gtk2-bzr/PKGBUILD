# Maintainer: Jakub Klinkovský <j.l.k@gmx.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Arkham <arkham at archlinux dot us>
# Contributor: hybraries <macwolf@archlinux.de>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Navi <navitwo.at.gmail.dot.com>
# Contributor: rabyte <rabyte.at.gmail.dot.com>
# Contributor: Johannes Krampf <wuischke.at.amule.dot.org>

pkgname=midori-gtk2-bzr
pkgver=6708
pkgrel=1
pkgdesc='Lightweight web browser based on WebKit and GTK2 (development version)'
arch=('x86_64' 'i686')
url='http://twotoasts.de/index.php?/pages/midori_summary.html'
license=('LGPL')
depends=('libzeitgeist' 'webkitgtk2' 'libnotify' 'libxss' 'hicolor-icon-theme' 'desktop-file-utils' 'libunique' 'gtk2' 'libsoup' 'libxml2')
makedepends=('pkg-config' 'bzr' 'python2' 'intltool' 'python2-docutils' 'vala' 'librsvg' 'cmake')
optdepends=('aria2: download utility'
            'steadyflow: download manager')
provides=('midori')
replaces=('midori-gtk2-git')
conflicts=('midori' 'midori-git' 'midori-gtk2-git' 'midori-bzr')
options=('!emptydirs')
install=midori.install
source=("midori::bzr+http://bazaar.launchpad.net/~midori/midori/trunk/")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/midori"

  bzr revno
}

build() {
  cd "$srcdir/midori"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/midori"

  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:

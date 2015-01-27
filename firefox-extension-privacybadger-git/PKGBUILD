# Maintainer: polyzen <polycitizen@gmail.com>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>

pkgname=firefox-extension-privacybadger-git
_gitname=privacybadgerfirefox
pkgver=0.2.5.7.g5150b3e
pkgrel=1
pkgdesc="Privacy Badger blocks spying ads and invisible trackers."
license=('GPL3')
arch=('any')
url="https://www.eff.org/privacybadger"
depends=('firefox')
makedepends=('git' 'addon-sdk')
conflicts=('firefox-extension-privacybadger')
source=('git://github.com/EFForg/privacybadgerfirefox')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir"/$_gitname
  git describe |sed 's/-/./g'
}

build() {
  cd "$srcdir"/$_gitname
  /opt/addon-sdk/bin/cfx xpi
}

package() {
  cd "$srcdir"/$_gitname
  unzip -q -d xpi privacybadgerfirefox.xpi
  cd xpi

  emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf) || return 1

  local dstdir="$pkgdir/usr/lib/firefox/browser/extensions/$emid"
  install -d "$dstdir"
  cp -r * "$dstdir"
  find $pkgdir -type d -exec chmod 0755 {} \;
  find $pkgdir -type f -exec chmod 0644 {} \;
}

# vim:set ts=2 sw=2 et:

# Maintainer: Sandy Carter <bwrsandman@gmail.com>
# PKGBUILD source: https://github.com/bwrsandman/pkgbuild/tree/master/pokemon-online-git

pkgname=pokemon-online-git
pkgver=2.5.1.r47.ged96410
pkgrel=1
pkgdesc="Online Pokemon Battle Simulator"
arch=('i686' 'x86_64')
url="http://pokemon-online.eu/"
license=('GPL3')

depends=('libpulse' 'libzip' 'qt5-base' 'qt5-multimedia' 'qt5-quick1'
         'qt5-script' 'qt5-declarative')
makedepends=('git')
conflicts=('pokemon-online')
provides=('pokemon-online')

source=('git://github.com/po-devs/pokemon-online.git'
        'git://github.com/po-devs/pkg-pokemononline.git')
sha1sums=('SKIP' 'SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  qmake-qt5 "CONFIG += po_all debian_package" 
  make
}

package() {
  cd "${srcdir}/${pkgname%-git}"

  # Binaries
  install -d -m755 "$pkgdir"/usr/bin/
  install -m755 bin/Pokemon-Online "$pkgdir"/usr/bin/Pokemon-Online
  install -m755 bin/Server "$pkgdir"/usr/bin/Pokemon-Online-Server

  # Libraries
  install -d -m755 "$pkgdir"/usr/lib/
  cp -P bin/libpo-battlemanager.so "$pkgdir"/usr/lib
  cp -P bin/libpo-battlemanager.so.* "$pkgdir"/usr/lib
  cp -P bin/libpo-pokemoninfo.so "$pkgdir"/usr/lib
  cp -P bin/libpo-pokemoninfo.so.* "$pkgdir"/usr/lib
  cp -P bin/libpo-teambuilder.so "$pkgdir"/usr/lib
  cp -P bin/libpo-teambuilder.so.* "$pkgdir"/usr/lib
  cp -P bin/libpo-utilities.so "$pkgdir"/usr/lib
  cp -P bin/libpo-utilities.so.* "$pkgdir"/usr/lib

  # Data
  install -d -m755 "$pkgdir"/usr/share/games/pokemon-online
  install -m644 bin/languages.txt "$pkgdir"/usr/share/games/pokemon-online
  install -m644 bin/version.ini "$pkgdir"/usr/share/games/pokemon-online
  cp -r bin/db "$pkgdir"/usr/share/games/pokemon-online
  cp -r bin/qml "$pkgdir"/usr/share/games/pokemon-online
  cp -r bin/Music "$pkgdir"/usr/share/games/pokemon-online
  cp -r bin/Themes "$pkgdir"/usr/share/games/pokemon-online
  cp -r bin/trans "$pkgdir"/usr/share/games/pokemon-online

  cd "$srcdir"/pkg-pokemononline
  install -d -m755 "$pkgdir"/usr/share/pixmaps
  install -m644 debian/pokemon-online.xpm "$pkgdir"/usr/share/pixmaps

  install -d -m755 "$pkgdir"/usr/share/applications
  install -m644 debian/pokemon-online-client.desktop "$pkgdir"/usr/share/applications
  install -m644 debian/pokemon-online-server.desktop "$pkgdir"/usr/share/applications
}

# vim:set ts=2 sw=2 et:

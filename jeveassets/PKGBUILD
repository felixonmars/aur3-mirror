# Maintainer: Kochetkov Andrey <gornet@gmail.com>

pkgname=jeveassets
pkgver=2.10.2
pkgrel=2
pkgdesc=" jEveAssets is an out-of-game asset manager for EVE Online, written in Java"
arch=('any')
url="http://eve.nikr.net/jeveasset"
license=('GPL')
depends=('java-runtime')
makedepends=('fastjar')
source=(
  http://eve.nikr.net/jeveassets/jeveassets-$pkgver.zip
  jeveassets.sh
  jeveassets.desktop
)

package() {
  cd "$srcdir"
  # install binary and menu item
  install -m 644 -D jeveassets.desktop "$pkgdir/usr/share/applications/${pkgname}.desktop"
  install -m 755 -D jeveassets.sh "$pkgdir/usr/bin/${pkgname}"

  cd "$srcdir/jEveAssets"
  # install license file
  install -m 644 -D license.txt "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"

  # copy main files
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  cp -r * "${pkgdir}/usr/share/${pkgname}"

  # install icon
  fastjar fx jeveassets.jar
  install -m 644 -D net/nikr/eve/jeveasset/gui/images/misc_assets_64.png "$pkgdir/usr/share/pixmaps/${pkgname}.png"
}

md5sums=('c269cd4fc0b67749bab80277d7e17e82'
         'f7d28accd91b105cfc26c3f1699ee245'
         '2f75e3ec47fa24a8e274e3e8f0aac997') #generate with 'makepkg -g'

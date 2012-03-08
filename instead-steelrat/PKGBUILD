# Maintainer: AlexanderR <rvacheva at nxt dot ru>
# Contributor Alex Ghoust <ghoust@skyper.homelinux.org>
pkgname=instead-steelrat
pkgver=0.6
pkgrel=1
pkgdesc="Become a steel rat is a Harry Harrison-inspired quest for INSTEAD text game engine. Warning: currently only Russion version is available!"
arch=('any')
url='http://instead-games.googlecode.com/'
license=('GPL' 'CCPL:by')
depends=('instead')
options=(!strip !zipman) # there are no binaries/manpages
sha1sums=('cdd23a4f802213cd6d03f868e52645f5441b3441')
source=("https://instead-games.googlecode.com/files/$pkgname-$pkgver.zip")

package() {
  cd "$srcdir/steelrat"

  install -dm755 "$pkgdir/usr/share/instead/games/steelrat/"{gfx,mus}
  install -m644 gfx/* "$pkgdir/usr/share/instead/games/steelrat/gfx"
  install -m644 mus/* "$pkgdir/usr/share/instead/games/steelrat/mus"
  install -m644 {main.lua,theme.ini} "$pkgdir/usr/share/instead/games/steelrat"
}

# vim:set ts=2 sw=2 et:

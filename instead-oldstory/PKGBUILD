# Maintainer: AlexanderR <rvacheva at nxt dot ru>
# Contributor Alex Ghoust <ghoust@skyper.homelinux.org>
pkgname=instead-oldstory
pkgver=0.4.4
pkgrel=1
pkgdesc="Old story is prequel to another INSTEAD text quest 'The Returning of the Quantum Cat'. Warning: package contains only Rusian version, currently there is no English translation available!"
arch=('any')
url='http://instead.syscall.ru/wiki/ru/games/oldstory'
license=('GPL' 'CCPL:by')
depends=('instead')
options=(!strip !zipman) # there are no binaries/manpages
sha1sums=('c3483bb325138678a4a07144ce82fc0ecec2347f')
source=("https://instead-games.googlecode.com/files/$pkgname-$pkgver.zip")

package() {
  cd "$srcdir/oldstory"

  install -dm755 "$pkgdir/usr/share/instead/games/oldstory/"{gfx,mus}
  install -m644 gfx/* "$pkgdir/usr/share/instead/games/oldstory/gfx"
  install -m644 mus/* "$pkgdir/usr/share/instead/games/oldstory/mus"
  install -m644 {main.lua,game.lua} "$pkgdir/usr/share/instead/games/oldstory"
}

# vim:set ts=2 sw=2 et:

# Maintainer: AlexanderR <rvacheva at nxt dot ru>
# Contributor Alex Ghoust <ghoust@skyper.homelinux.org>
pkgname=instead-cat
pkgver=1.6
pkgrel=1
pkgdesc="The Returning of the Quantum Cat is a quest for INSTEAD text games engine. This is the story about woodsman in the past, hacker-downshifter, his fight against evil and quantum paradoxes."
arch=('any')
url='http://instead.syscall.ru/wiki/en/games/returning-the-quantum-cat'
license=('GPL' 'CCPL:by')
groups=('instead-games')
depends=('instead')
options=(!strip !zipman) # there are no binaries/manpages
source=("https://instead-games.googlecode.com/files/$pkgname-$pkgver.zip")
sha1sums=('53e0e53cd92b66cabfb501433715d476706a3cd9')

package() {
  cd "$srcdir/cat"
  
  install -dm755 "$pkgdir/usr/share/instead/games/cat/"{gfx,mus}
  install -m644 gfx/* "$pkgdir/usr/share/instead/games/cat/gfx"
  install -m644 mus/* "$pkgdir/usr/share/instead/games/cat/mus"
  install -m644 {*.lua,*.png} "$pkgdir/usr/share/instead/games/cat"
}

# vim:set ts=2 sw=2 et:

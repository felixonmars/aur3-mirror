# Maintainer: AlexanderR <rvacheva at nxt dot ru>
# Contributor Alex Ghoust <ghoust@skyper.homelinux.org>
pkgname=instead-mirror
pkgver=0.9
pkgrel=1
pkgdesc="Remake of ZX Spectrum qult quest-game, featuring original graphics, music, recreated menu system and customizable level of complexity. Warning: currently only partial English translation is available!"
arch=('any')
url='http://instead.syscall.ru/wiki/en/games/mirror'
license=('GPL' 'CCPL:by')
depends=('instead>=1.6.0')
groups=('instead-games')
options=(!strip !zipman) # there are no binaries/manpages
source=("mirror-$pkgver.zip::http://instead.nailedgames.com/get/file/113002/game")
sha1sums=('eb1e17fb6c5b2fac9014df140327c330ea4ce48f')

package() {
  cd "$srcdir/mirror"

  install -dm755 "$pkgdir/usr/share/instead/games/mirror/"{fantasy,images,music}
  install -m644 fantasy/* "$pkgdir/usr/share/instead/games/mirror/fantasy"
  install -m644 images/* "$pkgdir/usr/share/instead/games/mirror/images"
  install -m644 music/* "$pkgdir/usr/share/instead/games/mirror/music"
  install -m644 {*.lua,theme.ini} "$pkgdir/usr/share/instead/games/mirror"
  install -D -m644 \!bugs.txt "$pkgdir/usr/share/doc/mirror/BUGS"
}

# vim:set ts=2 sw=2 et:

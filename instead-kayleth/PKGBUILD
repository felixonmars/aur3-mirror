# Maintainer: AlexanderR <rvacheva at nxt dot ru>
# Contributor goom <psylinuxoid@gmail.com>
pkgname=instead-kayleth
pkgver=0.4.1
pkgrel=1
pkgdesc="Remake of the text quest Kayleth for ZX Spectrum computer."
arch=('any')
url='http://instead.syscall.ru/wiki/en/games/kayleth'
license=('GPL' 'CCPL:by')
depends=('instead')
groups=('instead-games')
options=(!strip !zipman) # there are no binaries/manpages
source=("https://instead-games.googlecode.com/files/$pkgname-$pkgver.zip")
sha1sums=('496f877b9116fe0c07707553aec05ff0194bcf66')

package() {
  cd "$srcdir/kayleth"

  install -dm755 "$pkgdir/usr/share/instead/games/kayleth/"{images,music,theme}
  install -m644 images/* "$pkgdir/usr/share/instead/games/kayleth/images"
  install -m644 music/* "$pkgdir/usr/share/instead/games/kayleth/music"
  install -m644 theme/* "$pkgdir/usr/share/instead/games/kayleth/theme"
  install -m644 {*.lua,theme.ini} "$pkgdir/usr/share/instead/games/kayleth"
  install -Dm644 bugs.txt "$pkgdir/usr/share/doc/kaylet/BUGS"
}

# vim:set ts=2 sw=2 et:

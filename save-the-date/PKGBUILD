# Maintainer: AlexanderR <rvacheva at nxt dot ru>
pkgname=save-the-date
pkgver=1.0
pkgrel=1
pkgdesc="Short date sim with unusually high difficulty level"
arch=('any')
url="http://paperdino.com/games/$pkgname/"
license=('unknown:freeware')
depends=('renpy')
options=(!strip !zipman) # there are no binaries/manpages
md5sums=('f031f894f70929db7dbc9a042c1e6c88'
         'c1f4bd1a943bf6c61091c57487a4247e'
         '871a768ecdaba5e70eb3a3e0ca208bda')
source=("http://content.paperdino.com/savethedate-${pkgver}-linux.tar.bz2"
        "${pkgname}.sh"
	"${pkgname}.desktop")

package() {
  cd "$srcdir"

  install -D -m755 ${pkgname}.sh "$pkgdir/usr/bin/$pkgname"
  install -D -m644 ${pkgname}.desktop "$pkgdir/usr/share/applications/${pkgname}.desktop"

  cd "savethedate-$pkgver-linux"

  install -D -m644 icon.png "$pkgdir/usr/share/pixmaps/${pkgname}.png"
  install -dm755 "$pkgdir/usr/share/$pkgname"
  cp -r game/* "$pkgdir/usr/share/$pkgname"
  install -m644 "savethedate.py" "$pkgdir/usr/share/$pkgname"
  install -D -m644 'README.html' "$pkgdir/usr/share/doc/$pkgname/README.html"
}

# vim:set ts=2 sw=2 et:

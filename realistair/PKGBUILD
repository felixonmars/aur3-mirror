# Maintainer: AlexanderR <rvacheva at nxt dot ru>
pkgname=realistair
pkgver=1
pkgrel=3
pkgdesc="RE: Alistair++ is an English otome game (subtype of visual novel) that tells a story of a young girl fond of MMORPGs, her online and everyday life."
arch=('any')
url="http://sakevisual.com/$pkgname/"
license=('CCPL:by-nc-nd')
depends=('renpy')
options=(!strip !zipman) # there are no binaries/manpages
changelog=ChangeLog
md5sums=('830f6491f13e869857e997ca40165743'
         'ecd7f992718a44b4fcc009339f49305c'
         '52179b89f31f6a94a15efa20bac070d8'
         'e01979198b345e8106b303e733e59109'
         '8689d164098ec4edcfa978269ca8950b')
source=("http://dl.renai.us/games/$pkgname-linux-x86.tar.bz2"
        "${pkgname}.sh"
	"${pkgname}.desktop"
	"${pkgname}.ico"
	'python2.patch')

build() {
  cd "$srcdir/$pkgname-linux-x86"

  patch -p1 -i ../python2.patch
}

package() {
  cd "$srcdir"

  install -D -m755 ${pkgname}.sh "$pkgdir/usr/bin/$pkgname"
  install -D -m644 ${pkgname}.desktop "$pkgdir/usr/share/applications/${pkgname}.desktop"
  install -D -m644 ${pkgname}.ico "$pkgdir/usr/share/pixmaps/${pkgname}.ico"

  cd "$pkgname-linux-x86"

  install -dm755 "$pkgdir/usr/share/$pkgname"
  install -m644 game/* "$pkgdir/usr/share/$pkgname"
  install -m644 "RE-alistair.py" "$pkgdir/usr/share/$pkgname"
  install -D -m644 'README.html' "$pkgdir/usr/share/doc/$pkgname/README.html"
}

# vim:set ts=2 sw=2 et:

# Maintainer: Alexander Rødseth <rodseth@gmail.com>
pkgname=tweetdeck
pkgver=0_37.5
pkgrel=3
pkgdesc="Twitter client (uses Wine)"
arch=('any')
url="http://www.tweetdeck.com/"
license=('unknown')
depends=('wine')
makedepends=('p7zip')
source=("tweetdeck.msi::http://www.tweetdeck.com/download/pc/latest"
        "tweetdeck.desktop"
        "tweetdeck.sh"
        "tweetdeck.png::http://upload.wikimedia.org/wikipedia/en/f/f7/TweetDeck_logo.png")
sha256sums=('02e75dce2ec8c94063d5a2ba4cc29c53b2cb26f3fd0fa7a4b2b92aec4710d643'
            'ecf42858ebf4f9d0ae1d6b91f17e59acf72588c43cc3c61144497d046f29ac0f'
            'b19072a4413476b82ea68fe6e3d74dd6bed3e4341f50e33c5bf0dcc81267aba4'
            '1d8ceb4da61b2e73e2add50ee2b4e3db158226e68236d849f8d0cd6489682fed')

build() {
  7z x "$pkgname.msi" > /dev/null
}

package() {
  mkdir -p "$pkgdir/usr/share/$pkgname"
  cp -r *.{exe,dll,wyc,wav} "$pkgdir/usr/share/$pkgname"
  install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 "$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
}

# vim:set ts=2 sw=2 et:

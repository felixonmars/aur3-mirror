# Maintainer: Tobias Frilling <tobias@frilling-online.de>
pkgname=ttf-monaco-cyrillic
pkgver=6.1
pkgrel=1
pkgdesc="A monospaced sans-serif typeface by Apple. Supports cyrillic characters."
arch=('any')
license=('unknown')
url="http://www.apple.com/"
depends=('fontconfig')
replaces=('monaco_linux' 'monaco-linux-font')
conflicts=('monaco_linux' 'monaco-linux-font')
install=ttf-monaco.install
source=("https://github.com/cstrap/monaco-font/raw/master/Monaco_Linux.ttf")
sha1sums=('de2daa09a66a7a616c2093978c476ee107c5ac05')

package() {
  install -d "$pkgdir/usr/share/fonts/TTF/"
  install -m644 Monaco_Linux.ttf "$pkgdir/usr/share/fonts/TTF/"
}

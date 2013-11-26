# Maintainer: Julien Pecqueur (JPEC) <jpec[at]julienpecqueur[dot]net>
pkgname=raspyplayer
pkgver=v2.7
pkgrel=5
pkgdesc="A simple media player originally designed for the Raspberry Pi."
url="http://raspyplayer.org"
arch=('any')
license=('GPL')
depends=('python' 'tk' 'xterm' 'xdg-utils')
optdepends=('mplayer' 'omxplayer')
makedepends=('git')
md5sums=('SKIP')
source=("git://github.com/jpec/raspyplayer.git#branch=master")
_gitname="raspyplayer"

pkgver() {
cd "$_gitname"
echo $(git describe --tags | sed 's|-.*||')
}

package() {
cd "$_gitname"
# install files

echo "Installing raspyplayer-mc…"
install -Dm755 src/raspyplayer-mc.py "$pkgdir/usr/bin/raspyplayer-mc"
install -Dm644 src/raspyplayer-mc.desktop "$pkgdir/usr/share/applications/raspyplayer-mc.desktop"
install -Dm644 art/raspyplayer-mc.png "$pkgdir/usr/share/pixmaps/raspyplayer-mc.png"

echo "Installing raspyplayer-lite…"
install -Dm755 src/raspyplayer-lite.py "$pkgdir/usr/bin/raspyplayer-lite"
install -Dm644 src/raspyplayer-lite.desktop "$pkgdir/usr/share/applications/raspyplayer-lite.desktop"
install -Dm644 art/raspyplayer-lite.png "$pkgdir/usr/share/pixmaps/raspyplayer-lite.png"
}

# vim:set ts=2 sw=2 et:

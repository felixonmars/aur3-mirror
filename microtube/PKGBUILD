# Maintainer: Igor Isaias Banlian <igorisaiasbanlian[at]gmail[dot]com>
pkgname=microtube
pkgver=1.3
pkgrel=3
pkgdesc="Reproduz músicas em pseudo-streaming usando o site YouTube."
url="http://code.google.com/p/microtube/"
arch=('any')
license=('GPLv3')
depends=('bc' 'youtube-dl')
optdepends=('vlc' 'mplayer2')
source=("http://microtube.googlecode.com/files/microtube")
md5sums=('c3b5f83f489da60ee9c35680c85c658a')

build() {
  cd "${srcdir}"
  install -Dm644 $pkgname "$pkgdir/usr/bin/$pkgname"
  chmod +x "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
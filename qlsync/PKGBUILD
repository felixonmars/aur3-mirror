# Maintainer: Joshua Stiefer <facedelajunk@gmail.com>

pkgname=qlsync
pkgver=0.3
pkgrel=1
pkgdesc="Syncs your Quod Libet playlists to a portable device"
arch=('any')
license=('GPL2')
url="http://code.google.com/p/qlsync/"
depends=("python2" "quodlibet")
source=(https://qlsync.googlecode.com/files/$pkgname-$pkgver.tar.gz)
sha1sums=('26a0c34e2aa21e42fb9d2b5cfc1f665e4891fe1f')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir"
}

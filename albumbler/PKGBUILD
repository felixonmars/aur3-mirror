# Contributor: Kyle Keen <keenerd@gmail.com>
pkgname=albumbler
pkgver=20110222
pkgrel=1
pkgdesc="Like StumbleUpon for your music, it learns what you don't like."
arch=('any')
url="http://kmkeen.com/albumbler/"
license=('GPL')
depends=('python2')
makedepends=()
optdepends=('mocp: for music' \
            'cmus: for music' \
            'mpd: for music')
source=(http://kmkeen.com/$pkgname/$pkgname)
md5sums=('659f925eb83fb58a98456af4129667b5')

package	() {
  cd "$srcdir"
  install -D -m 0755 albumbler "$pkgdir"/usr/bin/albumbler
}


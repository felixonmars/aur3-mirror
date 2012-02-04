# Contributor: Cyker Way <cykerway at gmail dot com>

pkgname=(mpy)
pkgver=1.0
pkgrel=1
pkgdesc="A [Python + Curses]-based MPD client."
arch=(any)
url="http://mpy.cykerway.com/"
license=(GPL3)
depends=('python2' 'python2-httplib2' 'python-mpd' 'python-lxml' 'pyosd')
makedepends=()
provides=()
conflicts=('mpy-git')
source=(http://mpy.cykerway.com/downloads/mpy-$pkgver.tar.gz)
md5sums=('221d7b568e16aee263c64dfa496fa56b')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:

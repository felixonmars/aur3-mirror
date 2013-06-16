# Contributor: Cyker Way <cykerway at gmail dot com>

pkgname=(ncmpy)
pkgver=1.0
pkgrel=1
pkgdesc="A [Python + Curses]-based MPD client."
arch=(any)
url="http://ncmpy.cykerway.com/"
license=(GPL3)
depends=('python2' 'python2-httplib2' 'python2-mpd' 'python-lxml' 'pyosd')
makedepends=()
provides=()
conflicts=('ncmpy-git')
source=(http://ncmpy.cykerway.com/downloads/ncmpy-$pkgver.tar.gz)
md5sums=('27e9316e1806a79c7b89bf192a207398')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:

# Maintainer: wido <widowild [at] myopera [dot] com>

_pkgname=urwid-satext
pkgname=python2-urwid-satext-hg
pkgver=83
pkgrel=1
pkgdesc="Urwid satext is a curses-based user interface library for sat (salut a toi)."
license=('GPL')
arch=('any')
depends=('python2-urwid' 'python2')
url="http://www.goffi.org/"
conflicts=('python2-urwid-satext')
provides=('python2-urwid-satext=0.1.2')

source=("hg+http://repos.goffi.org/urwid-satext")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  hg identify -n
}

build() {
  cd "$srcdir/$_pkgname"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_pkgname"
  python2 setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
}

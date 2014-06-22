# Maintainer: Ondrej Kipila <ok100@openmailbox.org>

pkgname=lyvi
pkgver=2.0.0
pkgrel=1
pkgdesc="Command-line lyrics (and more!) viewer"
url="http://ok100.github.io/lyvi/"
arch=(any)
license=('WTFPLv2')
depends=('python-glyr-git' 'python-psutil' 'python-urwid')
optdepends=('python-pillow: background support'
            'python-dbus: mpris support'
            'python-gobject: mpris support')
makedepends=('python-pip')
source=(https://github.com/ok100/$pkgname/archive/v$pkgver.tar.gz)
md5sums=('8c85fc43b8f7f225fd4231801762a6bb')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root=$pkgdir
}

# vim:set ts=2 sw=2 et:

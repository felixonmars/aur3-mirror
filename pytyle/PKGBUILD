# Contributor: Andrew Gallant <andrew@pytyle.com>
# Maintainer: Andrew Gallant
pkgname=pytyle
pkgver=0.7.5
pkgrel=1
pkgdesc="Extensible tiling manager that fits in any EWMH compatible window manager."
arch=('any')
url="http://pytyle.com"
license=('GPL')
groups=()
depends=('python>=2.6' 'python-xlib')
source=(http://downloads.sourceforge.net/project/pytyle/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('0475a2f98732ef724423f3c19ecfa52e')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  python2 ./setup.py install --root=$pkgdir || return 1
}

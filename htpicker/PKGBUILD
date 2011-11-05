# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=htpicker
pkgver=0.1.3
pkgrel=2
pkgdesc="A simple file browser for your Linux-based HTPC (Home Theater PC)"
arch=('any')
url="http://incise.org/htpicker.html"
license=('GPL')
depends=('pywebkitgtk')
makedepends=('python2-distribute')
optdepends=('pylirc: remote control support'
            'python2-pyinotify: notifications support')
source=("http://pypi.python.org/packages/source/h/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('7e460570470a714f39d61371fd8c2c60')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python2 setup.py install --prefix=/usr --root="$pkgdir/"

  # python2 fix
  sed -i "s/env python/&2/" `grep -rl "env python" "$pkgdir"`
}

# vim:set ts=2 sw=2 et:

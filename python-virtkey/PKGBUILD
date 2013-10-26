# Contributor: Nuno Araujo <nuno.araujo@russo79.com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: codl <codl@aquageek.net>
# Contributor: Megamixman <Megamixman@gmail.com>

_pkgbase=virtkey
pkgname=python-virtkey
true && pkgname=(python-virtkey python2-virtkey)
pkgdesc="Python extension for emulating keypresses and getting layout information from the X server"
pkgver=0.63.0
pkgrel=2
arch=('i686' 'x86_64')
url="https://launchpad.net/virtkey"
license=('LGPL')
depends=('python' 'python2' 'libxtst' 'libxkbfile' 'gtk2')
source=(http://launchpad.net/$_pkgbase/${pkgver%.*}/$pkgver/+download/$_pkgbase-$pkgver.tar.gz)
md5sums=('c1569fbb143692aafba00758041fad98')

build() {
  cd "$srcdir/$_pkgbase-$pkgver"

  mkdir -p build_py3
  python3 setup.py build --build-base="${srcdir}/$_pkgbase-$pkgver/build_py3"

  mkdir -p build_py2
  python2 setup.py build --build-base="${srcdir}/$_pkgbase-$pkgver/build_py2"
}

package_python-virtkey() {
  true && depends=('python' 'libxtst' 'libxkbfile' 'gtk2')
  cd "$srcdir/$_pkgbase-$pkgver"
  python3 setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-virtkey() {
  true && depends=('python2' 'libxtst' 'libxkbfile' 'gtk2')
  cd "$srcdir/$_pkgbase-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

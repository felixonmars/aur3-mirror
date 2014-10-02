# $Id: PKGBUILD 70305 2012-05-04 08:21:08Z mtorromeo $
# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: Ralf Schmitt <ralf@systemexit.de>

pkgname=pypy-gevent
pkgver=1.0.157_gadb7b83
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Python network library that uses greenlet and libev for easy and scalable concurrency"
license=("MIT")
url="http://www.gevent.org/"
depends=('pypy>=2.4' 'pypy<2.5')
makedepends=('git')
source=("git://github.com/surfly/gevent.git")
md5sums=('SKIP')
options=('debug' 'strip' '!emptydirs')

pkgver() {
  cd gevent
  git describe --tags | sed 's/-/./;s/-/_/g'
}

build() {
  cd gevent

  LIBEV_EMBED=1 \
    CARES_EMBED=1 \
    PYTHON=pypy \
    pypy setup.py build
}

package() {
  cd gevent

  pypy setup.py install -O1 --root="$pkgdir"
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  find "$pkgdir" -name '*.c' -exec rm {} \;
  find "$pkgdir" -name '*.o' -exec rm {} \;
  find "$pkgdir/opt/pypy/site-packages/gevent/libev" \
    \( -name 'stamp-h1' -o -name 'Makefile*' -o -name 'config*' \
    -o -name 'install*' -o -name '*.sh' -o -name 'missing' -o -name 'libtool' \
    \) -exec rm {} \;
}

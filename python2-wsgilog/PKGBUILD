# Sumbitter: Myles English: myles at rockhead.biz

pkgname='python2-wsgilog'
pkgver=0.3
pkgrel=1
pkgdesc="WSGI logging and event reporting middleware"
arch=('i686' 'x86_64')
url="http://pypi.python.org/pypi/wsgilog"
license=('BSD')
makedepends=('python2' 'python2-distribute')
depends=('python2')
source=("http://pypi.python.org/packages/source/w/wsgilog/wsgilog-${pkgver}.tar.gz")
md5sums=('f22640806017552df0dc0bd3718f7dc5')

package_python2-wsgilog() {
  cd "$srcdir/wsgilog-$pkgver"
  python2 setup.py install --root="$pkgdir/"
}

# vim:set ts=2 sw=2 et:

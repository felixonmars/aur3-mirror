# Maintainer: Tom Wambold <tom5760@gmail.com>
pkgname=python2-emaneeventservice
pkgver=0.3.5
pkgrel=2
pkgdesc="Python2 bindings for the EMANE event service."
arch=('i686' 'x86_64')
url="http://labs.cengen.com/emane/download/addons/pythonbindings.html"
license=('BSD')
depends=('python2' 'libemaneeventservice')
source=(http://labs.cengen.com/emane/download/source/0.7.3/python-emaneeventservice-$pkgver.tar.gz)
md5sums=('f0d928cd03a97ea079b963992774eb59')

build() {
  cd "$srcdir/python-emaneeventservice-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/python-emaneeventservice-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:

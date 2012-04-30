# Maintainer: Tom Wambold <tom5760@gmail.com>
pkgname=python2-emaneeventlocation
pkgver=0.3.5
pkgrel=2
pkgdesc="Python2 bindings for the EMANE event service."
arch=('i686' 'x86_64')
url="http://labs.cengen.com/emane/download/addons/pythonbindings.html"
license=('BSD')
depends=('python2' 'libemaneeventservice')
source=(http://labs.cengen.com/emane/download/source/0.7.3/python-emaneeventlocation-$pkgver.tar.gz)
md5sums=('d4b58ea354ee67f063a5b38f2471cd50')

build() {
  cd "$srcdir/python-emaneeventlocation-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/python-emaneeventlocation-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:

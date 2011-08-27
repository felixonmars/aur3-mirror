# Maintainer : SpepS <dreamspepser at yahoo dot it>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

_p=python-eventlet-0.8
pkgname=python2-eventlet08
pkgver=0.8.11
pkgrel=1
pkgdesc="A networking library written in Python"
arch=('any')
url="http://sipsimpleclient.com/"
license=('LGPL')
depends=('python2' 'python2-greenlet' 'twisted' 'python2-pyopenssl')
provides=('python-eventlet=$pkgver')
conflicts=('python-eventlet')
source=("http://download.ag-projects.com/SipClient/$_p-$pkgver.tar.gz")
md5sums=('7450420f50e0fa1b264ff9b6f9da4761')

build() {
  cd "$srcdir/$_p-$pkgver"

  sed -i "s|\(bin/python\).*|\12|" `grep -rl "bin/python" .`

  python2 setup.py build
}
package() {
  cd "$srcdir/$_p-$pkgver"

  python2 setup.py install --root="$pkgdir" --optimize=1
}

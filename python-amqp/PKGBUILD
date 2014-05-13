# Maintainer: mutantmonkey <aur@mutantmonkey.in>
pkgname=python-amqp
pkgver=1.4.5
pkgrel=1
pkgdesc="Low-level AMQP client for Python (fork of amqplib)"
arch=('any')
url="http://github.com/celery/py-amqp"
license=('LGPL')
depends=('python')
options=(!emptydirs)
source=("http://pypi.python.org/packages/source/a/amqp/amqp-${pkgver}.tar.gz"{,.asc})
sha256sums=('534c807c0081ce9c2d517615e724cb6e9df17f79cd6cd4929653ea1ea60edb60'
            'SKIP')

package() {
  cd "$srcdir/amqp-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:

# Maintainer: mutantmonkey <aur@mutantmonkey.in>
pkgname=python-kombu
pkgver=3.0.21
pkgrel=1
pkgdesc="A messaging library for Python"
arch=('any')
url="http://kombu.readthedocs.org/"
license=('BSD')
depends=('python' 'python-amqp' 'python-anyjson')
options=(!emptydirs)
source=("http://pypi.python.org/packages/source/k/kombu/kombu-${pkgver}.tar.gz"{,.asc})
sha256sums=('2eaca88496bcfcf9b6d597999776853792ef35f919c37e2f0f151dfe38a60d3a'
            'SKIP')

package() {
  cd "$srcdir/kombu-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:

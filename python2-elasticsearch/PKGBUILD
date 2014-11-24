# Maintainer: Nicolas Barbey <nicolas.a.barbey@gmail.com>

pkgname=python2-elasticsearch
pkgver=1.2.0
pkgrel=3
pkgdesc="Python client for Elasticsearch"
arch=('any')
url="https://github.com/elasticsearch/elasticsearch-py"
license=('APACHE')
groups=()
depends=('python2' 'elasticsearch' 'python2-urllib3')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(https://pypi.python.org/packages/source/e/elasticsearch/elasticsearch-1.2.0.tar.gz#md5=56f240ec92b7241bf3b9f37a497c307c)
md5sums=('56f240ec92b7241bf3b9f37a497c307c')

package() {
  cd "$srcdir/elasticsearch-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:

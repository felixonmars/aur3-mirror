pkgname=python2-hcluster
pkgver=0.2.0
pkgrel=1
pkgdesc='This library provides Python functions for agglomerative clustering'
arch=('any')
url='https://code.google.com/p/scipy-cluster/'
license=('BSD')
depends=('python2' 'python2-numpy')
optdepends=(
  'ipython2: better interface'
  'python2-matplotlib: dendrogram plotting'
)
source=("https://scipy-cluster.googlecode.com/files/hcluster-$pkgver.tar.gz")
md5sums=('47b439d8892a70a0a79adb58bb1f6c5b')

package() {
  cd "$srcdir/hcluster-$pkgver"
  find . -name '*.py' -exec sed -i -e '1 s/python\s*$/python2/' {} \;
  python2 setup.py install "--root=$pkgdir" --optimize=1
}

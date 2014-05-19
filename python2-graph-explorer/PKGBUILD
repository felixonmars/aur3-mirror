# Maintainer: Nicolas Barbey <nicolas.a.barbey@gmail.com>

pkgname=python2-graph-explorer
pkgver=2.0.1
pkgrel=1
pkgdesc="A graphite dashboard powered by structured metrics"
arch=('any')
url="http://vimeo.github.io/graph-explorer/"
license=('APACHE')
groups=()
depends=('python2' 'elasticsearch' 'graphite' 'python2-pysqlite' 'python2-bottle' 'python2-wtforms' 'python2-elasticsearch' 'python2-urllib3' 'python2-paste')
makedepends=()
provides=('graph-explorer')
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install='install'
source=(https://pypi.python.org/packages/source/g/graph-explorer/graph-explorer-$pkgver.tar.gz)
md5sums=('c268f4899179337857a6d0135aac2617')

package() {
  cd "$srcdir/graph-explorer-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:

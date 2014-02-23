# Maintainer: Jacob Mourelos <jacob.mourelos@gmail.com>

pkgname=doconv
pkgver=0.1.3
pkgrel=1
pkgdesc='A tool for document file format conversion'
arch=('any')
url='https://github.com/jmourelos/doconv'
license=('BSD')
depends=('python2' 'python2-networkx' 'python2-stevedore' 'python2-lxml')
optdepends=('asciidoc')
makedepends=('python2-setuptools')

source=("https://pypi.python.org/packages/source/d/doconv/${pkgname}-${pkgver}.tar.gz")

package() { 
  cd "${srcdir}/${pkgname}-${pkgver}"

  python2 setup.py -q install --root="${pkgdir}" --optimize=1
}

md5sums=('d79b41805eb14f8ed571ae6a98054b15')

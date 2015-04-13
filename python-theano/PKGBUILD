# Maintainer: Antony Lee <anntzer dot lee at gmail dot com>

pkgname=python-theano
pkgver=0.7.0
pkgrel=2
pkgdesc='Definition and optimized evaluation of mathematical expressions on Numpy arrays.'
arch=('any')
url='http://www.deeplearning.net/software/theano/'
license=('BSD')
depends=('python-scipy')
makedepends=('python-distribute')
checkdepends=('python-nose')
optdepends=('cuda: for using the gpu backend'
            'python-pydot: to draw computation graphs')
source=("http://pypi.python.org/packages/source/T/Theano/Theano-${pkgver}.tar.gz")
md5sums=('099a9575801b71252b5bbbc3c34ed45a')

package() {
  cd Theano-${pkgver}
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/python-theano"
}

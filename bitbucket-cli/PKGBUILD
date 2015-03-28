# Maintainer: Zhehao Mao <zhehao.mao@gmail.com>
pkgname=bitbucket-cli
pkgver=0.5.1
pkgrel=1
pkgdesc='Command-line tool for accessing BitBucket'
arch=('any')
url='http://bitbucket.org/zhemao/bitbucket-cli/'
license=('BSD')
depends=('python2-requests')
source=("http://pypi.python.org/packages/source/b/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('c773f568b4d9a722761952cb6497f223')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 ./setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 ./setup.py install --root="${pkgdir}" --prefix="/usr" --optimize=1
}

# Contributor kreed <kreed@kreed.org>

pkgname=doge
pkgver=3.3.0
pkgrel=1
pkgdesc="doge meme motd script"
url="https://github.com/thiderman/doge"
arch=('any')
license=('MIT')
depends=('python')
source=("https://pypi.python.org/packages/source/d/doge/doge-$pkgver.tar.gz")

package() {
  cd doge-$pkgver
  python setup.py install --root=$pkgdir
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

md5sums=('c17589c22479a0e33e5259f8cbbb6f5f')

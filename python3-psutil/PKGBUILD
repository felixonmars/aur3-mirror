# Maintainer: Vinicius de Ávila jorge <vinicius.avila.jorge@gmail.com>

pkgname=python3-psutil
pkgver=0.4.1
pkgrel=1
pkgdesc="A process utilities module for Python3"
arch=(any)
url="https://code.google.com/p/psutil/"
license=('custom: New BSD')
depends=('python')
source=(https://psutil.googlecode.com/files/psutil-${pkgver}.tar.gz) 
sha1sums=('2705862e00280a7fa76cfb687dbd61623d5e236e')

package() {
  cd "$srcdir/psutil-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m 755 LICENSE "$pkgdir/"usr/share/licenses/$pkgname/LICENSE
}

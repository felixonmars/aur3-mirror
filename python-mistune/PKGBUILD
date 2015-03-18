# Maintainer: shmilee <echo c2htaWxlZS56anVAZ21haWwuY29tCg==|base64 -d>

_pkgname=mistune
pkgname=python-mistune
pkgver=0.5.1
pkgrel=1
pkgdesc="The fastest markdown parser in pure Python with renderer feature."
arch=('i686' 'x86_64')
url="https://github.com/lepture/mistune"
license=('BSD')
depends=('python' 'python-setuptools')
source=("https://github.com/lepture/mistune/archive/v${pkgver}.tar.gz")
md5sums=('1c6cfce28a4aa90cf125217cd6c6fe6c')

package() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:

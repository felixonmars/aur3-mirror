# Maintainer: Peter Johnson <tam dash cy at hiddenrock dot com>
pkgname=cyclops
pkgver=0.1
pkgrel=4
pkgdesc="A system log analyzer"
arch=('any')
license=('MIT')
url="http://tam.hiddenrock.com/projects/cyclops"
depends=('python' 'coreutils')
makedepends=()
source=(http://tam.hiddenrock.com/projects/cyclops/dist/${pkgname}-${pkgver}.tar.gz)
md5sums=('712aee254f887d9f36c1e890a3c7f97c')

build() {
  cd $srcdir/$pkgname-$pkgver
  python setup.py install --root=$pkgdir/ --optimize=1

  install -D -m644 ./LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}


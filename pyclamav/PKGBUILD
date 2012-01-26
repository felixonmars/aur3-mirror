# Maintainer: Paweł Tarasiuk <pablo.t89@gmail.com>
pkgname=pyclamav
pkgver=0.4.1
pkgrel=1
pkgdesc="Using libclamav with python"
arch=('i686' 'x86_64')
url="http://xael.org/norman/python/pyclamav/"
license=('GPL')
depends=('python2' 'clamav')
source=(http://xael.org/norman/python/pyclamav/$pkgname-$pkgver.tar.gz
        http://patch-tracker.debian.org/patch/series/dl/python-clamav/0.4.1-3/clamav-095-compat.patch)
md5sums=('9e1f29ea118bac87223ff4df3c077556'
         'a3289084f0790227488148d0de984256')

build() {
  cd $srcdir/$pkgname-$pkgver
  patch -p1 <../../clamav-095-compat.patch
  python2 setup.py build || return 1
  python2 setup.py install --prefix=/usr --root="$pkgdir" || return 1
}

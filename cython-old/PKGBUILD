# $Id: PKGBUILD 35774 2010-12-22 14:15:40Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Igor Scabini <furester @ gmail.com>

pkgname=cython-old
pkgver=0.13
pkgrel=1
pkgdesc="C-Extensions for Python "
arch=(i686 x86_64)
url="http://www.cython.org"
license=('APACHE')
depends=('python2')
conflicts=('cython')
provides=('cython=${pkgver}')
source=("http://cython.org/release/Cython-$pkgver.tar.gz")
md5sums=('27fa072e8282431864543e008fd9a19b')

build() {
  cd $srcdir/Cython-$pkgver
  python2 setup.py install --root=$pkgdir
}
md5sums=('ed2ec5e0df60a6b8e500bedf93bb1feb')

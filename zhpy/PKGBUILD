# Maintainer: Sean Yeh <snoblo at archlinux dot us>

pkgname=zhpy
pkgver=1.7.3.1
pkgrel=1
pkgdesc="Write Python language in Chinese"
arch=(any)
url="https://pypi.python.org/pypi/zhpy"
license=(MIT)
depends=(python2 python2-chardet)
makedepends=(python2-distribute)
source=("http://pypi.python.org/packages/source/z/zhpy/zhpy-${pkgver}.zip")
md5sums=('34512737bf67fc11c67e53b1af6ad46d')

package() {
  cd "${srcdir}/zhpy-${pkgver}"
  python2 setup.py install --root="$pkgdir/"
}


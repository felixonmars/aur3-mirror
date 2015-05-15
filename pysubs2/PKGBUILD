# Maintainer: Yamashita Ren <lemaitre dot lotus at gmail dot com>

pkgname=pysubs2
pkgver=0.2.0
pkgrel=2
arch='any'
pkgdesc="A library for editing subtitle files"
depends=('python')
license='MIT'
url="https://github.com/tkarabela/pysubs2/"
source=("https://github.com/tkarabela/$pkgname/archive/$pkgver.tar.gz")
md5sums=('248200f82b4069366d12510771223c86')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/"
  python setup.py install --root=${pkgdir} --optimize=1
}


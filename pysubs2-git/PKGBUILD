# Maintainer: Yamashita Ren <lemaitre dot lotus at gmail dot com>

pkgname=pysubs2-git
_pkgname=pysubs2
pkgver=0.2.0.r0.ge1f3298
pkgrel=1
arch='any'
pkgdesc="A library for editing subtitle files"
depends=('python')
license='MIT'
url="https://github.com/tkarabela/pysubs2/"
source=("git://github.com/tkarabela/pysubs2.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}/"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${_pkgname}/"
  python setup.py install --root="${pkgdir}" --optimize=1
}


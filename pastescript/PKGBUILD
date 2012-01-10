# Maintainer: apkawa <apkawa@gmail.com>

pkgname=pastescript
_pkgname=PasteScript
pkgver=1.7.5
pkgrel=1
pkgdesc="A pluggable command-line frontend, including commands to setup package file layouts"
arch=('i686' 'x86_64')
url="http://pypi.python.org/pypi/PasteScript"
license=('MIT')
depends=('python2' 'paste' 'pastedeploy')
source=(http://pypi.python.org/packages/source/P/${_pkgname}/${_pkgname}-${pkgver}.tar.gz)


build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
  python2 setup.py install --root=${pkgdir} || return 1
}

md5sums=('9101a3a23809d3413b39ba8b75dd0bce')
md5sums=('4c72d78dcb6bb993f30536842c16af4d')

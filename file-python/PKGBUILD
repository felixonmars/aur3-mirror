# Maintainer: Gerad Munsch <gmunsch@unforgivendevelopment.com>
#
# NOTE: based on the 'file' package from the core repo
# -- 'file' package notes --
# Maintainer: Allan McRae <allan@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

_pkgbase=file
pkgname=${_pkgbase}-python
pkgver=5.19
pkgrel=1
pkgdesc="File type identification utility -- python bindings"
arch=('i686' 'x86_64')
license=('custom')
url="http://www.darwinsys.com/file/"
depends=('glibc' 'zlib' "file=${pkgver}")
provides=('python-magic')
conflicts=('python-magic' 'python-magic-git')
source=(ftp://ftp.astron.com/pub/${_pkgbase}/${_pkgbase}-${pkgver}.tar.gz)
md5sums=('e3526f59023f3f7d1ffa4d541335edab')

build() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  ./configure --prefix=/usr --datadir=/usr/share/file
  make 
  cd "python"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  install -Dm644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
  cd "python"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

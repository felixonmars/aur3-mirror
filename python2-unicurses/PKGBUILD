# Maintainer: Marshall Mattingly III <mattinm.code@gmail.com>
pkgname=python2-unicurses
_pkgname=UniCurses
pkgver=1.2
pkgrel=1
pkgdesc="UniCurses is a wrapper for Python 2.x/3.x that provides a unified set of curses functions on all platforms (Windows, Linux, MacOSX) with syntax close to that of the orignal NCurses."
arch=(any)
url="http://sourceforge.net/projects/pyunicurses"
license=('GPL')
depends=('python2')
makedepends=('unzip')
options=(!emptydirs)
source=("${_pkgname}-${pkgver}.zip::http://sourceforge.net/projects/pyunicurses/files/unicurses-${pkgver}/${_pkgname}-${pkgver}.zip/download")
noextract=("${_pkgname}-${pkgver}.zip")
md5sums=('5ec7f4933a5884c1642bab7ec4737a32')

package() {
  cd "$srcdir"
  unzip "${_pkgname}-${pkgver}.zip"
  cd "${_pkgname}-${pkgver}"

  # remove unneeded parts of the install
  sed -ie '15,$d' setup.py
  echo "      data_files=[])" >> setup.py

  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:

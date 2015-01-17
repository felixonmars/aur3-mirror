# Maintainer: Raymond Smith <raymondbarrettsmith at gmail dot com>
pkgname=daetools
pkgver=1.4.0
pkgrel=1
pkgdesc="Python tools for solving differential algebraic equations (DAEs)"
arch=('i686' 'x86_64')
url="http://daetools.sourceforge.net"
license=('GPL3')
depends=('python2-scipy' 'python2-matplotlib' 'python2-pyqt4')
makedepends=('python2-distribute')
source=("http://downloads.sourceforge.net/daetools/${pkgver}/${pkgname}-${pkgver}-gnu_linux-${CARCH}.tar.gz")
sha256sums=('54444957f4716049f0251eed3c225694016ee1580543eee45dd0644171f5e5f5')
[ "$CARCH" = "x86_64" ] && sha256sums[0]='21ba372e9f2758f1b5c8ef3ee75c7afb8c9c68f893236c9368e8db03c7d02f2e'

package() {
  cd "${srcdir}/${pkgname}-${pkgver}-gnu_linux-${CARCH}"
  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
  # Fix the bin scripts to call python2
  cd "${pkgdir}"
  sed -i "s|python|python2|" usr/bin/daeplotter
  sed -i "s|python|python2|" usr/bin/daeexamples
  mv usr/lib64/* usr/lib
  rmdir usr/lib64
}

# vim:set ts=2 sw=2 et tw=0:

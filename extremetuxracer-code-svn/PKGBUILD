# Maintainer: Zachary Wilson <swamptech@host.sk>

_pkgname=extremetuxracer-code
pkgname=${_pkgname}-svn
pkgver=r534
pkgrel=1
pkgdesc="Bleeding-edge version of the downhill racing game starring Tux, using SFML libraries."
arch=('i686' 'x86_64')
url="http://sourceforge.net/p/extremetuxracer/"
license=('GPLv2')
makedepends=('subversion' )
depends=('sfml>=2.0' 'csfml>=2.0' 'mesa' 'glu')
conflicts=('ppracer' 'etracer' 'extremetuxracer')
replaces=('ppracer' 'etracer' 'extremetuxracer')
source=("${_pkgname}::svn+http://svn.code.sf.net/p/extremetuxracer/code/trunk")
md5sums=('SKIP')
sha256sums=('SKIP')

pkgver() {
  cd ${SRCDEST}/${_pkgname}
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd "$srcdir"/$_pkgname
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/$_pkgname
  make prefix="$pkgdir"/usr install
}

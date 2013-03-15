# Contributor: Andrew Wong <andrew@wongdev.com>
pkgname=freeglut-svn
pkgver=1559
pkgrel=1
pkgdesc="Provides functionality for small OpenGL programs"
arch=('i686' 'x86_64')
url="http://freeglut.sourceforge.net/"
license=('MIT')
depends=('libxi' 'libxrandr' 'libgl')
makedepends=('mesa' 'glu' 'libxxf86vm' 'cmake' 'subversion')
provides=('glut' 'freeglut')
conflicts=('glut' 'freeglut')
replaces=('glut' 'freeglut')
options=('!libtool')
source=()
md5sums=()

_svnmod="freeglut"
_svntrunk="https://freeglut.svn.sourceforge.net/svnroot/freeglut/trunk/freeglut/freeglut/"

build() {
  cd "${srcdir}"

  if [[ -d "${_svnmod}/.svn"  ]]; then
    cd "${_svnmod}" && svn up -r "${pkgver}"
  else
    svn co "${_svntrunk}" --config-dir ./ -r "${pkgver}" "${_svnmod}"
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "${srcdir}/${_svnmod}-build"
  cp -r "${srcdir}/${_svnmod}" "${srcdir}/${_svnmod}-build"
  cd "${srcdir}/${_svnmod}-build"

  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make all
}

package() {
  cd "${srcdir}/${_svnmod}-build"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname%-svn}/LICENSE"
}

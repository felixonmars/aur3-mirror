# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from CVS sources.

# Maintainer: <oslik@mail.ru>
pkgname=pyqwt3d-cvs
pkgver=20121006
pkgrel=1
pkgdesc="Python bindings for QwtPlot3D library"
arch=("i686" "x86_64")
url="http://pyqwt.sourceforge.net/"
license=('GPL')
groups=()
depends=('qwtplot3d')
makedepends=('cvs')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=('pyqwt3d-0.16-Qt-4.7.patch')
md5sums=('64f22358b99799eac733c12e21c3b377')
noextract=()
#generate with 'makepkg -g'

_cvsroot="pserver:anonymous@pyqwt.cvs.sourceforge.net:/cvsroot/pyqwt"
_cvsmod="pyqwt3d"

build() {
  cd "$srcdir"
  msg "Connecting to $_cvsmod.sourceforge.net CVS server...."
  if [ -d $_cvsmod/CVS ]; then
    cd $_cvsmod
    cvs -z3 update -d
  else
    cvs -z3 -d:$_cvsroot co -P $_cvsmod
    cd $_cvsmod
  fi

  msg "CVS checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_cvsmod-build"
  cp -r "$srcdir/$_cvsmod" "$srcdir/$_cvsmod-build"
  cd "$srcdir/$_cvsmod-build"
  #
  # BUILD HERE
  #
  patch -p1 < ../../pyqwt3d-0.16-Qt-4.7.patch
  cd configure
  python2 configure.py -I/usr/include/qwt -I/usr/include/qwtplot3d -lqwtplot3d
  make || return 1
}

package() {
  cd "$srcdir/$_cvsmod-build/configure"
  make DESTDIR=$pkgdir install || return 1
}

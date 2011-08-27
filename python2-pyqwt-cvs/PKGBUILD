# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>

pkgname=python2-pyqwt-cvs
pkgver=20110529
pkgrel=1
pkgdesc="Python bindings for Qt Widgets for Technical Applications, CVS version"
arch=("i686" "x86_64")
url="http://pyqwt.sourceforge.net/"
depends=('python2' 'python2-pyqt>=4.8.0' 'python2-numpy>=1.3.0' 'qwt>=5.0.0' 'python2-sip>=4.12.0')
makedepends=('cvs')
options=('!makeflags')
provides=('pyqwt==5.2.0.999')
conflicts=('pyqwt')
license=("GPL")

_cvsroot=":pserver:anonymous@pyqwt.cvs.sourceforge.net:/cvsroot/pyqwt"
_cvsmod="pyqwt5"

build() {
  cd "$srcdir"
  msg "Connecting to $_cvsmod.sourceforge.net CVS server...."
  if [ -d $_cvsmod/CVS ]; then
    cd $_cvsmod
    cvs -z3 update -d
  else
    cvs -z3 -d $_cvsroot co -D $pkgver -f $_cvsmod
    cd $_cvsmod
  fi

  msg "CVS checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_cvsmod-build"
  cp -r "$srcdir/$_cvsmod" "$srcdir/$_cvsmod-build"
  cd "$srcdir/$_cvsmod-build"

  # build pyqwt:
  cd configure
  python2 configure.py -I/usr/include/qwt -lqwt

  make
}

package() {
  cd "$srcdir/$_cvsmod-build/configure"
  make DESTDIR="$pkgdir" install
}


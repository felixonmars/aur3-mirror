# Contributor: Christian Hesse <mail@earthworm.de

pkgname=luma-cvs
pkgver=20101116
pkgrel=1
pkgdesc="A feature-full LDAP browser/editor using PyQT -- CVS checkout"
arch=('any')
url="http://luma.sourceforge.net/"
license=('GPL')
depends=('pyqt3' 'python2-ldap')
makedepends=('cvs')
conflicts=('luma')
provides=('luma')

_cvsroot=":pserver:anonymous:@luma.cvs.sourceforge.net:/cvsroot/luma"
_cvsmod="luma"

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

  cd $srcdir/luma/
  mkdir $pkgdir/usr
  python2 install.py --prefix=$pkgdir/usr
}
md5sums=()

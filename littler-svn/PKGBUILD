# Contributor: antzek9 <antze.k9 at googlemail dot com>
# Maintainer: antzek9

pkgname=littler-svn
pkgver=1
pkgrel=1
pkgdesc="Provides hash-bang capability for GNU R."
arch=('i686' 'x86_64')
url="http://code.google.com/p/littler"
license=('GPL')
groups=('science')
depends=('r')
makedepends=('make' 'subversion' )
provides=('littler')
conflicts=('littler')
_svntrunk=http://littler.googlecode.com/svn/trunk/
_svnmod=littler

build() {
  svn co $_svntrunk $_svnmod
  msg "SVN checkout done or server timeout"
  msg "Starting bootstrapping..."
  cd ${srcdir}/$_svnmod
  ./bootstrap || return 1
  make prefix="$pkgdir/usr/" install || return 1
  rm -rf ${srcdir}/$_svnmod
}


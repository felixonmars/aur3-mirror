# Contributor: Hiroshi Yui (hiroshiyui@gmail.com)

pkgname=ibus-array
pkgver=16
pkgrel=5
pkgdesc='Array 30 Input Method for iBus'
arch=('i686' 'x86_64')
url="http://code.google.com/p/ibus-array/"
license=('GPLv2')
depends=('ibus>=1.4.0' 'python2' 'glibc')
makedepends=('automake')
source=('20110930-ibus_1.4.0.diff')
sha256sums=('cc899640acc85efd86705c914efa706f0ce957227b350a4473df08a739bc5d6e')

_svntrunk=http://ibus-array.googlecode.com/svn/trunk/
_svnmod=ibus-array-read-only

build() {
  cd ${srcdir}
  
  svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cd $_svnmod

  export PYTHON='/usr/bin/python2'
  aclocal
  automake --add-missing
	./configure  --prefix=/usr LIBS="-ldl"
  patch -p 1 < ../../20110930-ibus_1.4.0.diff
	make || return 1
	make DESTDIR=$pkgdir install
}

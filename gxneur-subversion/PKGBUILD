# Contributor: Denis Terskov aka neurosurgeon <terskov.den@gmail.com>
pkgname=gxneur-subversion
pkgver=621
pkgrel=1
pkgdesc="GTK frontend for xneur (svn-version)"
url="http://xneur.ru/"
arch=(i686 x86_64)
license=(GPL)
depends=('libglade' 'xneur-subversion')
makedepends=('subversion')
conflicts=('gxneur')
provides=('gxneur')
source=()
md5sums=()

_svntrunk=svn://xneur.ru:3690/xneur/gxneur
_svnmod=gxneur

build() {
	cd $startdir/src/    
	msg "Connecting to Xneur SVN server...."
	svn co $_svntrunk $_svnmod

	msg "SVN checkout done or server timeout"
  	msg "Starting make..."

	cd $startdir/src/$_svnmod
	./autogen.sh --prefix=/usr
	make || return 1
   	make DESTDIR=$startdir/pkg install
}

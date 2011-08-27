# Maintainer:  ulceris_at_yandex.ru

pkgname=graphlcd-base-svn
pkgver=285
pkgrel=1
_kernver=2.6.30-ARCH
pkgdesc="GraphLCD driver library "
arch=('i686' 'x86_64')
url="http://developer.berlios.de/"
license=('GPL')
depends=()
makedepends=('subversion')
provides=('graphlcd-base')

_svntrunk=svn://svn.berlios.de/graphlcd/trunk
_svnmod=graphlcd-base

build() {

cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
      (cd $_svnmod && svn up -r $pkgver)
        else
	    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
	fi
	      
	        msg "SVN checkout done or server timeout"
		msg "Starting make..."
		  
        rm -rf "$srcdir/$_svnmod-build"
        cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
	cd "$srcdir/$_svnmod-build/graphlcd-base"
		
	make  all  || return 1
	make DESTDIR=$startdir/pkg/usr install || return 1
        rm -rf ${srcdir}/$_svnmod-build || return 1
}


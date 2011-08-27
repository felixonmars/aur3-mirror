# Contributor: Calimero <calimeroteknik@free.fr>
pkgname=libpipi-svn
pkgver=3645
pkgrel=1
pkgdesc="The Pathetic Image Processing Interface"
arch=('i686' 'x86_64')
url="http://caca.zoy.org/wiki/libpipi"
license=('GPL')
#depends=(!mono) #please uninstall mono or this won't build !
_svnmod="libpipi"
_svntrunk="svn://svn.zoy.org/caca/libpipi/trunk"

build() {
        cd $srcdir
        msg "Connecting to $_svnmod SVN server..."
        svn co $_svntrunk

        msg "SVN checkout done or server timeout"
        msg "Starting make..."

        cd trunk

        # compile
	./bootstrap
	./configure --prefix="/usr"
        make PREFIX="/usr" || return 1
        msg "Installing..."
        make install PREFIX="/usr" DESTDIR="$pkgdir" || return 1
}

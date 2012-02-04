# Maintainer : libernux <libernux55@gmail.com>

pkgname=elsa-svn-arch
pkgver=62858
pkgrel=1
pkgdesc="E17 display manager"
url="http://trac.enlightenment.org/e"
license=("GPL3")
arch=("i686" "x86_64")
provides=('elsa')
conflicts=('entrance')
depends=('elementary-svn')
makedepends=('subversion')
source=("elsa.pam" "elsa.conf")
md5sums=('8162a1043977dd96401082c3a5fa2c36'
         'be00acf967616ba8d8b794fc15ac67a0')

_svntrunk="http://svn.enlightenment.org/svn/e/trunk/PROTO/elsa/"
_svnmod="elsa"

build ()
{
	cd $srcdir

	msg "Connecting to $_svntrunk SVN server...."
	if [ -d $_svnmod/.svn ]; then
		(cd $_svnmod && svn up -r $pkgver)
	else
		svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
	fi

	msg "SVN checkout done or server timeout"
	msg "Starting make..."

	cp -r $_svnmod $_svnmod-build
	cd $_svnmod-build
	./autogen.sh --prefix=/usr --sysconfdir=/etc
	make
}

package()
{
	cd $srcdir/$_svnmod-build
	make DESTDIR=$pkgdir install

	install -Dm644 $startdir/elsa.pam \
	$pkgdir/etc/pam.d/elsa

	install -Dm644 $startdir/elsa.conf \
	$pkgdir/etc/elsa.conf

	rm -r $srcdir/$_svnmod-build
}


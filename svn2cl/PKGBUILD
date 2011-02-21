#Contributor: lang2 <wenzhi.liang@gmail.com>

arch=('i686' 'x86_64')
pkgname=svn2cl
pkgver=0.12
pkgrel=2
pkgdesc="a xsl stylesheet for generating a classic GNU-style ChangeLog from a subversion repository log."
url="http://ch.tudelft.nl/~arthur/svn2cl/"
depends=('subversion' 'libxslt')
makedepends=()
conflicts=()
replaces=()
backup=()
license=('Freeware')
install=
source=(http://arthurdejong.org/svn2cl/svn2cl-$pkgver.tar.gz)
md5sums=('028f52e0a2d5c3b859b053067ee1af2c')

build() 
{
	tmp_file=pm-py.$$
	cd $startdir/src/$pkgname-$pkgver
	install -d $startdir/pkg/opt/$pkgname-$pkgver
	install -d $startdir/pkg/usr/bin
	install -d $startdir/pkg/usr/man/man1
	install -m 664 * $startdir/pkg/opt/$pkgname-$pkgver
	chmod a+x $startdir/pkg/opt/$pkgname-$pkgver/svn2cl.sh
	cd $startdir/pkg/usr/bin
	ln -s ../../opt/$pkgname-$pkgver/svn2cl.sh
	cd $startdir/pkg/usr/man/man1
	ln -s ../../../opt/$pkgname-$pkgver/svn2cl.1
}

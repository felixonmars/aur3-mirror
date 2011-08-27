# Maintainer: Matthew Bauer <mjbauer95@gmail.com>
# Contributor: 3ED <krzysztof1987@gmail.com>
_pkgname=rsget
pkgname=$_pkgname-svn
pkgver=11288
pkgrel=2
pkgdesc="RapidShareGET - rapidshare files downloader"
arch=('any')
url="http://rsget.pl/"
license=('GPL')
depends=('wget' 'perl' 'perl-www-curl' 'perl-uri')
makedepends=('svn')

_svntrunk=http://svn.pld-linux.org/svn/toys/$_pkgname.pl
_svnmod=$_pkgname.pl

build() {
	cd "$srcdir"

	if [ -d $_svnmod/.svn ]; then
		(cd $_svnmod && svn up -r $pkgver)
	else
		svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
	fi

	msg "SVN checkout done or server timeout"
	msg "Starting make..."

	cd $_pkgname.pl

	DESTDIR=$pkgdir make -e install
}

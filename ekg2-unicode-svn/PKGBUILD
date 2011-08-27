# Contributor: Karol Maciaszek <karol.maciaszek@gmail.com>
arch=(i686 x86_64)
pkgname=ekg2-unicode-svn
pkgver=4100
pkgrel=1
pkgdesc="ncurses based Jabber, Gadu-Gadu, Tlen and IRC client with unicode support"
url="http://www.ekg2.org"
license=('GPL')

depends=('aspell' 'python' 'libgadu' 'gnutls')
makedepends=('subversion' 'automake')
conflicts=('ekg2')
provides=('ekg2')

source=()
md5sums=()

_svntrunk=http://toxygen.net/svn/ekg2/trunk/
_svnmod=ekg2

build() {
	cd $startdir/src

	if [ -d $_svnmod/.svn ]; then
		(cd $_svnmod && svn up -r $pkgver)
	else
		svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
	fi

	msg "SVN checkout done or server timeout"
	msg "Starting make..."

	cp -r $_svnmod $_svnmod-build
	cd $_svnmod-build

	./autogen.sh

	./configure --prefix=/usr --enable-unicode --with-libgadu
	make || return 1
	make DESTDIR=$startdir/pkg/ install

	rm -rf $startdir/src/$_svnmod-build
}


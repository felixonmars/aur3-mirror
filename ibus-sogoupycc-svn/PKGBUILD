# Maintainer: WU Jun <quark at lihdd dot net>

pkgname=ibus-sogoupycc-svn
pkgver=230
pkgrel=1
pkgdesc="ibus-sogoupycc is a Sogou cloud client, a Chinese input method on ibus platform. This is its svn version."
arch=('i686' 'x86_64')
url="http://ibus-sogoupycc.googlecode.com/"
license=('GPL')
depends=('ibus>=1.2.0'
        'lua>=5.1' 'lua<=5.1.99'
        'luasocket'
        'sqlite3'
        'gtk2'
        'libnotify')
makedepends=('subversion>=1.5' 'cmake>=2.6')
provides=()
replaces=('ibus-sogoupycc')
conflicts=('ibus-sogoupycc')
source=(http://ibus-sogoupycc.googlecode.com/files/open-phrase-201003.tar.gz)
noextract=()
md5sums=('64c29758b2837ef0c70d823a3b31ec3e')

_svntrunk=$url/svn/trunk/linux
_svnmod=$pkgname

build() {
	cd "$srcdir"
	if [ -d $_svnmod/.svn ]; then
		(cd $_svnmod && svn up)
	else
		svn co $_svntrunk $_svnmod
	fi

	msg "SVN checkout done or server timeout"
	msg "Starting make..."

	cd "$srcdir/$_svnmod"
	./build.sh || return 1
}

package() {
	cd ${srcdir}/${_svnmod}/build
	make DESTDIR=${pkgdir} install || return 1
	mkdir $pkgdir/usr/share/ibus-sogoupycc/db/
	install -Dm644 ${srcdir}/db/main.db \
			${pkgdir}/usr/share/ibus-sogoupycc/db/main.db
}

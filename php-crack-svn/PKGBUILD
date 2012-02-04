# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=php-crack-svn
pkgver=297236
pkgrel=1
pkgdesc="This package provides an interface to the cracklib (libcrack) libraries that come standard on most unix-like distributions."
arch=('i686' 'x86_64')
url="http://pecl.php.net/package/crack"
license=('PHP')
depends=('php' 'cracklib')
conflicts=('php-crack')
provides=('php-crack')
makedepends=('subversion' 'words')
source=(crack.ini)
md5sums=('dc02af2e5c0dfc0b37edf24325cf642d')

_svntrunk=http://svn.php.net/repository/pecl/crack/trunk/
_svnmod=$pkgname

build() {
	cd $srcdir

	if [ -d $_svnmod/.svn ]; then
		(cd $_svnmod && svn up -r $pkgver)
	else
		svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
	fi

	msg "SVN checkout done or server timeout"
	msg "Starting make..."

	cp -r $_svnmod $_svnmod-build
	cd $_svnmod-build

	phpize
	./configure --prefix=/usr --with-crack
	make
}

package() {
	cd $srcdir/$_svnmod-build

	make INSTALL_ROOT=$pkgdir install

	mkdir -p "$pkgdir/usr/share/dict"

	find /usr/share/dict -type f | while read DICT; do
		cracklib-format "$DICT" | cracklib-packer "${pkgdir}${DICT}"
	done

	cd "$pkgdir/usr/share/dict"
	find /usr/share/dict -type l | while read LINK; do
		LINK_NAME="$(basename $LINK)"
		LINK_DEST="$(readlink $LINK)"
		ln -s "$LINK_DEST.hwm" "$LINK_NAME.hwm"
		ln -s "$LINK_DEST.pwd" "$LINK_NAME.pwd"
		ln -s "$LINK_DEST.pwi" "$LINK_NAME.pwi"
	done

	install -D -m644 ${srcdir}/crack.ini ${pkgdir}/etc/php/conf.d/crack.ini
}
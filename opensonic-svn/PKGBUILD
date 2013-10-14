# Maintainer: Hakim Zulkufli <acrox999@gmail.com>

pkgname=opensonic-svn
pkgver=759
pkgrel=1
pkgdesc="An open source approach of the popular game Sonic The Hedgehog. Now known as Open Surge. (SVN version.)"
arch=('any')
url="http://opensnc.sourceforge.net/"
license=('GPL2')
depends=('allegro4' 'alfont' 'openal' 'alure' 'dumb' 'zlib' 'desktop-file-utils')
makedepends=('svn' 'cmake')
conflicts=('opensonic')
provides=('opensonic')
source=("$pkgname"::'svn://svn.code.sf.net/p/opensnc/code/opensurge/trunk/'
	'opensurge.desktop')
md5sums=('SKIP'
         'a8e7c0b3a8dc732f46fe58a770bf2d24')

pkgver() {
	cd "$pkgname"
	local ver="$(svnversion)"
	printf "%s" "${ver//[[:alpha:]]}"
}

build() {
	cd "$pkgname"
	cmake -DDIR_INSTALL=/opt/opensurge .
	make -j
}

package() {
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/share/applications"
	mkdir -p "$pkgdir/usr/share/pixmaps"
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir" install
	install -D -m755 "$srcdir/$pkgname/opensurge" "$pkgdir/usr/bin/"
	install -D -m644 "$srcdir/$pkgname/src/misc/opensurge.ico" "$pkgdir/usr/share/pixmaps/opensurge.ico"
	cd $srcdir
	desktop-file-install opensurge.desktop --dir "$pkgdir/usr/share/applications/"
	find "$pkgdir/opt/opensurge" -type d -exec chmod 755 {} +
	find "$pkgdir/opt/opensurge" -type f -exec chmod 644 {} +
}

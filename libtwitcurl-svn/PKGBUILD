# Maintainer: Adam Bevelhymer a.k.a. thebeav <adam.bevelhymerATgmailDOTcom>

pkgname=libtwitcurl-svn
pkgver=93
pkgrel=2
pkgdesc="A pure C++ twitter API library based on cURL"
arch=('i686' 'x86_64')
url="http://code.google.com/p/twitcurl/"
license=('custom:MIT')
depends=('curl')
makedepends=('subversion')

_svntrunk="http://twitcurl.googlecode.com/svn/trunk/libtwitcurl/"
_svnmod="twitcurl-$pkgver"

build() {
	cd "$srcdir"
	msg "Downloading from SVN server...."
	svn co "$_svntrunk" "$_svnmod"
	msg "Building..."
	cd "$srcdir/$_svnmod/"
	make
}

package() {
	cd "$srcdir/$_svnmod/"

	mkdir "$pkgdir/usr"
	mkdir "$pkgdir/usr/lib"
	mkdir "$pkgdir/usr/include"

	install -Dm755 libtwitcurl.so.1.0 "$pkgdir/usr/lib/"
	install -Dm644 twitcurl.h "$pkgdir/usr/include/"
	install -Dm644 oauthlib.h "$pkgdir/usr/include/"

	ln -sf "$pkgdir/usr/lib/libtwitcurl.so.1.0" "$pkgdir/usr/lib/libtwitcurl.so"
	ln -sf "$pkgdir/usr/lib/libtwitcurl.so.1.0" "$pkgdir/usr/lib/libtwitcurl.so.1"

	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

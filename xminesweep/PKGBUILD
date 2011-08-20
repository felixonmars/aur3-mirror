# Contributor: bocke <bocke@mycity.rs>

pkgname=xminesweep
pkgver=3.0
pkgrel=1
pkgdesc="X11 minesweeeper game"
arch=('i686' 'x86_64')
url="ftp://ftp.slackware.com/pub/slackware/slackware-current/source/xap/xgames"
license=('custom:free for non-commercial use')
depends=('libxaw')
makedepends=('imake')
source=("ftp://ftp.slackware.com/pub/slackware/slackware-current/source/xap/xgames/${pkgname}${pkgver}.tar.gz"
		"$pkgname.desktop"
		"$pkgname.xpm"
		"fix_includes.patch"
		'COPYING')
md5sums=('9f44d636d6dc3c1f87480755dee6c29c'
		 'e31b3c4aa6d5ed60339026725bcb836b'
		 '66049b69220cddccfa5fb634f0255823'
		 '4ab338148faf996bb5d5df0c311ff7fc'
		 '0b54d0e30081baa0e793ccdd81ed9ce1')

build() {
	cd "$srcdir/${pkgname}${pkgver}"
	# This patch adds stdlib.h to xminesweep.h (needed for exit and free) 
	patch -p1 < "${srcdir}/fix_includes.patch"

	# Building
	xmkmf -a
	make || return 1

	# Installing manually
	install -m 755 -d "$pkgdir/usr/bin"
	install -m 755 "${srcdir}/${pkgname}${pkgver}/$pkgname" \
		"$pkgdir/usr/bin/$pkgname"
	# Installing docs
	install -m 755 -d "$pkgdir/usr/share/doc/$pkgname-$pkgver"
	install -m 644 "${srcdir}/${pkgname}${pkgver}/README" \
		"$pkgdir/usr/share/doc/$pkgname-$pkgver"
	# Installing manual
	install -m 755 -d "$pkgdir/usr/share/man/man6"
	cat "$srcdir/${pkgname}${pkgver}/$pkgname.man" | gzip > "$pkgdir/usr/share/man/man6/$pkgname.6.gz"
	chmod 644 "$pkgdir/usr/share/man/man6/$pkgname.6.gz"
	# Installing desktop entry and icon
	install -m 755 -d "$pkgdir/usr/share/applications"
	install -m 644 "${srcdir}/$pkgname.desktop" "$pkgdir/usr/share/applications"
	install -m 755 -d "$pkgdir/usr/share/pixmaps"
	install -m 644 "${srcdir}/$pkgname.xpm" "$pkgdir/usr/share/pixmaps"
	# Installing license
	install -m 755 -d "$pkgdir/usr/share/licenses/$pkgname-$pkgver"
	install -m 644 "$srcdir/COPYING" "$pkgdir/usr/share/licenses/$pkgname-$pkgver"
}

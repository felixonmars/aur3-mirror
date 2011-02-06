# Maintainer: marenz <marenz@supradigital.org>

pkgname="ion-3_xinerama"
pkgver="20090110"
pkgrel=1
pkgdesc="Tiling tabbed window manager"
url="http://modeemi.fi/~tuomov/ion"
arch=('i686' 'x86_64')
license=('LGPL2')
depends=('libsm' 'libxext' 'lua>=5.1')
makedepends=('libtool' 'sed')
install="$pkgname.install"
source=("http://iki.fi/tuomov/dl/ion-3-$pkgver.tar.gz"
	"system.mk"
	"http://wannabehacker.com/src/mod_xinerama-20080923.tar.gz"
	"modulelist.mk")



build() {
	cd "$startdir"
	# Copy building configuration.
	cp "$srcdir/system.mk" "$srcdir/ion-3-$pkgver"
	cp "$srcdir/modulelist.mk" "$srcdir/ion-3-$pkgver"
	cp -r "$srcdir/mod_xinerama-3" "$srcdir/ion-3-$pkgver/mod_xinerama"

	# Replace the date information in the .install file.
	_pkgdate="$(echo "$pkgver" | sed 's/\([0-9]\{4\}\)\([0-9]\{2\}\)\([0-9]\{2\}\)/{year=\1, month=\2, day=\3}/')"
	sed -i "s/_pkgdate='[^']*'/_pkgdate='${_pkgdate}'/" "$pkgname.install"

	# Build it.
	cd "$srcdir/ion-3-$pkgver"
	MAKEFLAGS="" make || return 1
	make PREFIX="$pkgdir/usr" ETCDIR="$pkgdir/etc/ion3" install
}
md5sums=('1f17be1e87187b4af7de047187cc4930'
         '07a5d42ef3247b9d842ec0995d232bd7'
         '97f7c5674151e046b801eb2e03650380'
         'ce86d282589fa1b7261c0e515cc23fb6')

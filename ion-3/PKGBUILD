# Maintainer: thotypous <matiasΘarchlinux-br·org>

pkgname="ion-3"
pkgver="20090110"
pkgrel=2
pkgdesc="Tiling tabbed window manager"
url="http://modeemi.fi/~tuomov/ion"
arch=('i686' 'x86_64')
license=('LGPL2')
depends=('libsm' 'libxext' 'lua>=5.1')
makedepends=('libtool' 'sed')
install="$pkgname.install"
source=("http://archlinux-stuff.googlecode.com/files/$pkgname-$pkgver.tar.gz"
	"system.mk")
md5sums=('1f17be1e87187b4af7de047187cc4930'
         '07a5d42ef3247b9d842ec0995d232bd7')

build() {
	cd "$startdir"
	# Copy building configuration.
	cp "$srcdir/system.mk" "$srcdir/$pkgname-$pkgver"
	# Replace the date information in the .install file.
	_pkgdate="$(echo "$pkgver" | sed 's/\([0-9]\{4\}\)\([0-9]\{2\}\)\([0-9]\{2\}\)/{year=\1, month=\2, day=\3}/')"
	sed -i "s/_pkgdate='[^']*'/_pkgdate='${_pkgdate}'/" "$pkgname.install"

	# Build it.
	cd "$srcdir/$pkgname-$pkgver"
	MAKEFLAGS="" make || return 1
	make PREFIX="$pkgdir/usr" ETCDIR="$pkgdir/etc/ion3" install
}

# Provider: realturner < realturner at gmail dot com >

pkgname="ion-3-xft"
_pkgname="ion-3"
pkgver="20090110"
pkgrel=1
pkgdesc="Tiling tabbed window manager, XFT patched version"
url="http://modeemi.fi/~tuomov/ion"
arch=('i686' 'x86_64')
license=('LGPL2')
depends=('libsm' 'libxext' 'lua>=5.1' 'libxft')
makedepends=('libtool' 'sed')
conflicts=('ion-3')
provides=('ion-3')
install="${_pkgname}.install"
source=("http://iki.fi/tuomov/dl/${_pkgname}-$pkgver.tar.gz"
	"system.mk"
	"xft-ion3-20090110.patch")
md5sums=('1f17be1e87187b4af7de047187cc4930'
         '288ddc4e94f568448fd08a6a6da14cdc'
         '68f3da20b45ec583347b5325d9062e19')

build() {
	cd "$srcdir/${_pkgname}-$pkgver"
	# Patch file
	patch -Np3 -i ../xft-ion3-20090110.patch
	# Copy building configuration.
	cp "$srcdir/system.mk" "$srcdir/${_pkgname}-$pkgver"
	# Replace the date information in the .install file.
	_pkgdate="$(echo "$pkgver" | sed 's/\([0-9]\{4\}\)\([0-9]\{2\}\)\([0-9]\{2\}\)/{year=\1, month=\2, day=\3}/')"
	sed -i "s/_pkgdate='[^']*'/_pkgdate='${_pkgdate}'/" "${_pkgname}.install"

	# Build it.
	cd "$srcdir/${_pkgname}-$pkgver"
	MAKEFLAGS="" make || return 1
	make PREFIX="$pkgdir/usr" ETCDIR="$pkgdir/etc/ion3" install
}

# Maintainer: udeved <udeved@openrc4arch.site40.net>

pkgname=krcstat
pkgver=0.7.6
pkgrel=5
pkgdesc="Graphic replacement for the openrc rc-status and rc-update command line utilities."
arch=('i686' 'x86_64')
url="http://binro.org"
license=('GPL')
groups=('openrc')
depends=('kdebase-runtime' 'openrc-core')
makedepends=('cmake' 'automoc4')
source=("$url/$pkgname-$pkgver.tar.bz2" 'gentoo-release' 'arch.patch')

prepare(){
	cd "$srcdir/$pkgname-$pkgver"
	patch -p1 -i "$srcdir/arch.patch"
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	cmake ../$pkgname-$pkgver \
		-DCMAKE_BUILD_TYPE=Release \
		-DKDE4_BUILD_TESTS=OFF \
		-DCMAKE_SKIP_RPATH=ON \
		-DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install

	install -Dm644 "$srcdir/gentoo-release" "$pkgdir/etc/arch-openrc-release"
}

sha256sums=('0560f304df99869e1dd3e2054feff15ff6ecbc829b11a16f5c78220f186ee26f'
            '99acafcaeb707022121779edad43180285e8ed061f31c4b94a273f1488c05212'
            'f9e5223174a1c3f330abc7ec92e8b5f1722fd955f045623857b180c8d725eb6c')

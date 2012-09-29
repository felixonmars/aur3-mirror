# Maintainer: Vinycius Maia <suportevg@uol.com.br>

pkgname=r8168-zen
_pkgname=r8168
pkgver=8.032.00
pkgrel=1
pkgdesc="A zen kernel module for Realtek 8168 network cards"
url="http://www.realtek.com.tw"
license=("GPL")
arch=('i686' 'x86_64')
depends=('glibc' 'linux-zen>=3.5' 'linux-zen<3.6')
makedepends=('linux-zen-headers')
source=(http://r8168.googlecode.com/files/$_pkgname-$pkgver.tar.bz2
        $pkgname.install)
install=$pkgname.install
md5sums=('942ce02459a181093f77bb4d5cc75d45'
         '8e626bc9fac454120267e7be2c328aaa')

_extramodules=extramodules-3.5-zen

build() {
	cd "$_pkgname-$pkgver"
	local _kernver="$(cat /usr/lib/modules/$_extramodules/version || true)"

	# avoid using the Makefile directly -- it doesn't understand
	# any kernel but the current.
	make -C /usr/lib/modules/$_kernver/build \
			SUBDIRS="$srcdir/$_pkgname-$pkgver/src" \
			EXTRA_CFLAGS="-DCONFIG_R8168_NAPI -DCONFIG_R8168_VLAN" \
			modules
}

package() {
	cd "$_pkgname-$pkgver"
	install -d -m755 "$pkgdir/usr/lib/modprobe.d"
	install -Dm644 src/$_pkgname.ko "$pkgdir/usr/lib/modules/$_extramodules/$_pkgname.ko"
	echo "blacklist r8169" >> "$pkgdir/usr/lib/modprobe.d/r8168-zen.conf"
	find "$pkgdir" -name '*.ko' -exec gzip -9 {} +
}


# Maintainer: Sven-Ola Tuecke <sven-ola@gmx.de>
pkgname=chrontel-wetab
pkgver=2012_06_11
pkgrel=1
pkgdesc="HDMI driver for the Pegatron Tab / WeTab / ExoPC as available on the Chromium-OS git repository."
arch=("x86_64" "i686")
url="http://git.chromium.org/gitweb/?p=chromiumos/third_party/chrontel.git"
license=("BSD")
depends=("alsa-lib" "xorg-server" "libxrandr")
conflicts=("chrontel-wetab-rpm")
makedepends=("git")
backup=("etc/${pkgname}.conf" "etc/systemd/system/${pkgname}.service")
install=${pkgname}.install

source=(
	"$pkgname-${pkgver}::git+http://git.chromium.org/chromiumos/third_party/chrontel.git#tag=697c6bd5237fa800c314153779624187a9c4e0e6"
	ch7036_start
	${pkgname}.conf
	${pkgname}.install
	${pkgname}.service
	${pkgname}-modprobe.conf
	${pkgname}-modules-load.conf
)

build() {
	cd $srcdir/$pkgname-$pkgver
	make CCFLAGS="-DUSE_ALSA_CONTROL"
}

package() {
	install -Dm755 ch7036_start $pkgdir/usr/sbin/ch7036_start
	install -Dm644 ${pkgname}.conf $pkgdir/etc/${pkgname}.conf
	install -Dm644 ${pkgname}-modprobe.conf $pkgdir/etc/modprobe.d/${pkgname}.conf
	install -Dm644 ${pkgname}-modules-load.conf $pkgdir/etc/modules-load.d/${pkgname}.conf
	install -Dm644 ${pkgname}.service $pkgdir/etc/systemd/system/${pkgname}.service
	cd $srcdir/$pkgname-$pkgver
	install -Dm755 ch7036_debug $pkgdir/usr/sbin/ch7036_debug
	install -Dm755 ch7036_monitor $pkgdir/usr/sbin/ch7036_monitor
	install -Dm644 fw7036.bin $pkgdir/lib/firmware/chrontel/fw7036.bin
	install -Dm644 License.txt $pkgdir/usr/share/licenses/${pkgname}/LICENSE
}

# Remove lines below and run "makepkg -g >> PKGBUILD" to update

md5sums=('SKIP'
         '82a8e369f05b0c72620c800910739609'
         '5c292e39c882ef5a68b2d4a2003ce4bc'
         '118ddd72b493ff4b186557d8d2b89bf4'
         '9cb7ffb2af2ae2f181588c255424a1e7'
         '3272b033819db684f57f9f05b761fb4c'
         'a4956f19b9ab814d80497ba7a4f01976')

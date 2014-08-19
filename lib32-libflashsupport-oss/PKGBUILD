# Contributor: syne <madlikene[at]aim.com>

pkgname="lib32-libflashsupport-oss"
pkgver="4.2_2003"
pkgrel=1
pkgdesc="Open Sound System UNIX audio architecture support for Flash plugin"
arch=('x86_64')
url="http://developer.opensound.com/"
license=('GPL2')
depends=('oss' 'lib32-glibc')
conflicts=('lib32-libflashsupport-pulse')
source=(libflashsupport.so)
md5sums=('a570871b26f6e7e947b67072eeff4a2a')

package() {
	install -Dm755 libflashsupport.so "${pkgdir}/usr/lib/libflashsupport.so"
}

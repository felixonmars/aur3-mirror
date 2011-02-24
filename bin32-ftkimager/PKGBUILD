# Maintainer: David Hunter <archlinux at synackrst dot net>

pkgname=bin32-ftkimager
pkgver=2.9.0
pkgrel=1
pkgdesc="Commercial forensic imaging software by Access Data"
arch=('x86_64')
url="http://accessdata.com/support/adownloads#FTKImager"
license=('unknown')
depends=("lib32-gcc-libs" "lib32-zlib" "lib32-openssl>=1.0.0")
provides=('ftkimager')
source=(http://accessdata.com/downloads/current_releases/imager/FTK%20ImagerCLI%202.9.0_Fedora.tar.gz)
md5sums=('552942bffaeb97bd25e95dd45ff5b338')

package() {
	mkdir -p ${pkgdir}/usr/bin
	cp ${srcdir}/ftkimager ${pkgdir}/usr/bin

	# Dirty hack to make openssl work like it does on a Fedora system
	mkdir -p ${pkgdir}/usr/lib32
	ln -s libcrypto.so.1.0.0 ${pkgdir}/usr/lib32/libcrypto.so.10
}

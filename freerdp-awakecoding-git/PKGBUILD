# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Source: https://github.com/nicoulaj/archlinux-packages
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Alexey Vasiliev <robbinton@gmail.com>

pkgname=freerdp-awakecoding-git
pkgdesc="Free RDP client  - awakecoding's fork"
pkgver=283.19d2bc3
pkgrel=4
depends=(openssl
         libxcursor
         libcups
         alsa-lib
         libxext
         libxdamage
         ffmpeg
         libxkbfile
         libxinerama
         libxv)
makedepends=(git
             krb5
             cmake
             damageproto)
arch=(i686 x86_64)
url="https://github.com/awakecoding/FreeRDP"
license=(GPL)
provides=(freerdp)
conflicts=(freerdp freerdp-git)
source=("freerdp::git+https://github.com/awakecoding/FreeRDP.git")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/freerdp"
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
	cd "${srcdir}/freerdp"
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib .
	make
}

package() {
	cd "${srcdir}/freerdp"
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib .
	make DESTDIR="${pkgdir}/" install
}

# Contributor: Patrick Bartels <p4ddy.b@gmail.com>
# Maintainer: dongiovanni <dongiovanni@archlinux.de>
# Maintainer: quarkup <nuno.aja@gmail.com>
#

_kernver="2.6.31-fbcondecor"

pkgname="v86d-fbcondecor"
pkgver="0.1.9"
pkgrel="2"
pkgdesc="v86d is the userspace helper for uvesafb that runs x86 code in an emulated environment"
url="http://dev.gentoo.org/~spock/projects/uvesafb/"
license=('GPL2')
arch=('i686' 'x86_64')
makedepends=('klibc' 'kernel26-fbcondecor')
provides=('v86d-fbcondecor')
install='v86d.install'
source=("http://dev.gentoo.org/~spock/projects/uvesafb/archive/v86d-${pkgver}.tar.bz2"
	"v86d.initcpio_install")

md5sums=('ebbbc8e7013c9544b6ba6981add43831'
	 '27ece23320434e8705d8f84810584ae3')

build() {
	cd $startdir/src/v86d-${pkgver}

	./configure --default --with-klibc
	make -j1 KDIR=/usr/src/linux-${_kernver} || return 1
	make DESTDIR=${startdir}/pkg/ install || return 1

	install -D -m644 ${startdir}/src/v86d.initcpio_install ${startdir}/pkg/lib/initcpio/install/v86d
}

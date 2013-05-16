# Maintainer: Evan Pitstick <nerdx00 NOSPAM gmail DOT com>

pkgname=live-build-git
pkgver=3.0.5.1
pkgrel=1
pkgdesc='Tool to create debian-based live cd/dvd/usb images from a configuration directory.'
arch=('i686' 'x86_64')
url='http://live.debian.net/devel/live-build/'
license=('GPL3')
depends=('debootstrap')
optdepends=('debian-archive-keyring: for checking downloaded debian packages'
	'gnupg1: for checking downloaded debian packages')
makedepends=('git')
provides=('live-build')
conflicts=('live-build')
source=("${pkgname}::git://live-systems.org/git/live-build.git#branch=debian-old-3.0")
md5sums=('SKIP')

pkgver() {

    cd "${srcdir}/${pkgname}"
    git describe --always | sed 's|-|.|g' | sed 's|^debian/||g'

}

package() {

	cd "${srcdir}/${pkgname}"
	make DESTDIR="${pkgdir}/" install

}

# vim: ts=4 sts=4 sw=4 noet
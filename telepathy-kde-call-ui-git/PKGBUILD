# Contributor: George Brooke <george+arch.aur@george-brooke.co.uk>
# Contributor: laloch <laloch@atlas.cz>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Maintainer: ava1ar <mail(at)ava1ar(dot)info>

pkgname=telepathy-kde-call-ui-git
_pkgname=ktp-call-ui
pkgver=v0.8.1.7.g1d40805
pkgrel=1
pkgdesc="Voice/Video Call UI for KDE4 Telepathy"
arch=('i686' 'x86_64')
url="https://projects.kde.org/projects/extragear/network/telepathy/ktp-call-ui"
license=('GPL')
depends=('qt-gstreamer-git')
makedepends=('cmake' 'automoc4' 'git' 'boost')
source=('git+http://anongit.kde.org/ktp-call-ui')
sha1sums=('SKIP')

pkgver() {
	cd ${_pkgname}/src
	echo $(git describe --always | sed 's/-/./g')
}

build() {
	cd ${srcdir}/${_pkgname}
	cmake -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd ${srcdir}/${_pkgname}
	make DESTDIR="${pkgdir}" install
}

# Maintainer: graysky <graysky AT archlinux DOT us>
# Contributer: trya <tryagainprod@gmail.com>

pkgname=libva-git
pkgver=libva.1.3.0.2.g8f6a3dd
pkgrel=1
_gitname=libva
pkgdesc='Video Acceleration (VA) API for Linux. Git version.'
arch=('i686' 'x86_64')
url='http://freedesktop.org/wiki/Software/vaapi'
license=('MIT')
depends=('libgl' 'libdrm' 'libxfixes')
conflicts=('libva')
provides=('libva')
makedepends=('git' 'mesa')
optdepends=('libva-vdpau-driver: vdpau back-end for nvidia'
            'libva-intel-driver: back-end for intel cards')
source=("git://anongit.freedesktop.org/vaapi/$_gitname")
md5sums=(SKIP)


pkgver() {
	cd ${_gitname}
	git describe --always | sed 's|-|.|g'
}

build() {
  cd ${_gitname}
	./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd ${_gitname}
  make DESTDIR="$pkgdir" install
  install -m644 -D COPYING "$pkgdir"/usr/share/licenses/$_gitname/COPYING
}

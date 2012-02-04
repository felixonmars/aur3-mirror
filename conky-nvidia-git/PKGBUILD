# Maintainer: Chris Sakalis <chrissakalis@gmail.com>

pkgname=conky-nvidia-git
_pkgname=conky
pkgver=20120126
pkgrel=1
pkgdesc='An advanced, highly configurable system monitor for X based on torsmo. Build with Nvidia support. This is meant as a temporary package until 1.8.2 becomes the stable version.'
arch=('i686' 'x86_64')
url='http://conky.sourceforge.net/'
license=('BSD' 'GPL')
replaces=('torsmo')
conflicts=('conky')
provides=('conky')
makedepends=('git' 'cmake')
depends=('alsa-lib' 'libxml2' 'curl' 'wireless_tools' 'libxft' 'glib2' 'libxdamage' 'imlib2' 'nvidia' 'libxnvctrl' 'lua')

build() {
	cd "${srcdir}"
  msg "Connecting to GIT server...."

	if [ -d conky ] ; then
    cd conky && git pull origin
    msg "The local files are updated."
  else
    git clone --depth 1 "git://git.omp.am/conky.git" || return 1
  fi

	msg "GIT checkout done or server timeout"

	cd "$srcdir/conky"
	mkdir -p build
	cd build
	cmake -DBUILD_CURL=ON \
				-DBUILD_IMLIB2=ON \
				-DBUILD_NVIDIA=ON \
				-DBUILD_RSS=ON \
				-DBUILD_IBM=ON \
				-DBUILD_LUA_CAIRO=OFF \
				-DBUILD_LUA_IMLIB2=OFF \
				-DBUILD_WEATHER_XOAP=ON \
				-DBUILD_WEATHER_METAR=ON \
				-DBUILD_WLAN=ON \
				-DBUILD_MYSQL=OFF \
				-DCMAKE_INSTALL_PREFIX='/usr' \
				../ || return 1

	make -j || return 1
}

package() {
	cd "$srcdir/conky/build"
	make DESTDIR="$pkgdir" install || return 1
	cd "${srcdir}/conky"
	install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

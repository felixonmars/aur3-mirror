# Maintainer: Artur Kaleta <akaleta91@gmail.com>

pkgname=('openjk-sp' 'openjk-mp')
pkgbase='openjk-vanilla-git'
pkgver=2581.078d63a
pkgrel=1
pkgdesc='Jedi Knight III Engine'
arch=('i686' 'x86_64')
url="https://github.com/JACoders/OpenJK"
license=('GPL')

depends=('libgl' 'openal' 'zlib' 'sdl2' 'libpng' 'libjpeg')
makedepends=('cmake' 'nasm')

source=("openjk::git://github.com/JACoders/OpenJK.git"
				'openjk.install'
				'openjkmp.png'
				'openjksp.png'
				'openjkmp.desktop'
				'openjksp.desktop')
install=openjk.install

sha256sums=('SKIP'
            '8873237a7c6f12a0347b3e44cb237110ba526603e2b64aa4914bf4845be477c2'
            '0e82e720777eeb2043c2c25cdbce702c6d4ca077543aedfe51e5c4e96cf03969'
            'afb2c1a757720c70798e7f7218f823297a43bc61e0cb192e9443df67c2963903'
            '1bfbc278405efde38572624ef809dab770a63d109195ddf09c42cb0039667abb'
            'aa1b77682f88e621e055d10c6946720c530437fe78ed3c3a02485329dc8e6be8')
            
_DESTDIR="/opt/openjk"

pkgver() {
  cd openjk
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${srcdir}/openjk"

  mkdir build
  cd build
  cmake ../ \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=${_DESTDIR}
  make
}

package_openjk-sp() {
  pkgdesc='Jedi Knight III Engine - Single Player'
  
  cd "${srcdir}/openjk/build/code"
  
  make DESTDIR="${pkgdir}" install

  install -Dm644 "${srcdir}/openjksp.png" "${pkgdir}/usr/share/pixmaps/openjksp.png"
  install -Dm644 "${srcdir}/openjksp.desktop" "${pkgdir}/usr/share/applications/openjksp.desktop"
  
  cd "${pkgdir}${_DESTDIR}"
  mv OpenJK base
}

package_openjk-mp() {
  pkgdesc='Jedi Knight III Engine - Multi Player'
  cd "${srcdir}/openjk/build/codemp"

	make DESTDIR="${pkgdir}" install
	
	install -Dm644 "${srcdir}/openjkmp.png" "${pkgdir}/usr/share/pixmaps/openjkmp.png"
	install -Dm644 "${srcdir}/openjkmp.desktop" "${pkgdir}/usr/share/applications/openjkmp.desktop"
	
	cd "${pkgdir}${_DESTDIR}"
	mv OpenJK base
}

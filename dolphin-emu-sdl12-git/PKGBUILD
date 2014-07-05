# Maintainer: Eduardo Sánchez Muñoz <eduardosanchezmunoz@gmail.com>

pkgname=dolphin-emu-sdl12-git
_name=dolphin-emu
pkgver=4.0.r2012.gee100cf
pkgrel=1
pkgdesc="A Gamecube / Wii / Triforce emulator. Forced to use SDL 1.2 because SDL 2 fails to detect gamepads."
arch=('x86_64')
url="http://www.dolphin-emu.org/"
license=('GPL2')
depends=('bluez-libs' 'ffmpeg' 'libao' 'libusbx' 'miniupnpc' 'openal' 'polarssl' 'portaudio' 'sdl' 'soundtouch' 'wxgtk')
makedepends=('cmake' 'git')
optdepends=('pulseaudio: PulseAudio backend')
options=('!emptydirs')
provides=('dolphin-emu')
conflicts=('dolphin-emu' 'dolphin-emu-git')
source=("$_name::git+https://github.com/dolphin-emu/dolphin.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_name"
	
	git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	truncate --size 0 "$srcdir/$_name/CMakeTests/FindSDL2.cmake"
	
	rm -rf "$srcdir/$_name-build"
	mkdir -p "$srcdir/$_name-build"
	cd "$srcdir/$_name-build"
	
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr "$srcdir/$_name"
	make

}

package() {
	cd "$srcdir/$_name-build"
	
	make DESTDIR="$pkgdir" install
}

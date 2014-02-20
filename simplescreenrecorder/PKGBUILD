pkgname=simplescreenrecorder
pkgver=0.2.0
pkgrel=1
pkgdesc="A feature-rich screen recorder that supports X11 and OpenGL."
arch=("i686" "x86_64")
url="http://www.maartenbaert.be/simplescreenrecorder/"
license=("GPL3")
source=("git+https://github.com/MaartenBaert/ssr.git#tag=0.2.0")
md5sums=("SKIP")
depends=("qt4" "ffmpeg" "alsa-lib" "libpulse" "jack" "libgl" "glu" "libx11" "libxext" "libxfixes")
if test "$CARCH" == x86_64; then
	optdepends=("lib32-simplescreenrecorder: OpenGL recording of 32-bit applications")
fi
makedepends=("git")
options=("!libtool")
install=simplescreenrecorder.install

build() {
	cd ssr
	./configure --prefix=/usr --disable-assert
	make
}
package() {
	cd ssr
	make DESTDIR="${pkgdir}" install
}

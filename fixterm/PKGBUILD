pkgname=fixterm
pkgdesc="A tiny utility to sync the size of a terminal between the terminal emulator and the terminal device interface"
pkgver=1
pkgrel=1
## currently I don't have an armv7h processor, if this program works on arm please leave a comment
arch=('i686' 'x86_64')
depends=('glibc')
license=('custom')
url="http://cafbit.com/entry/terminal_window_size_detection_over"
source=('http://cafbit.com/resource/fixterm.c')

prepare() {
	head -n 19 fixterm.c > README
}

build() {
	cc ${CFLAGS} ${LDFLAGS} -o fixterm fixterm.c
}

package() {
	install -dm755 "${pkgdir}"/usr/{bin,share/{licenses,doc}/${pkgname}}
	install -m644 README "${pkgdir}/usr/share/doc/${pkgname}"
	install -m755 fixterm "${pkgdir}/usr/bin"
	ln -srf "${pkgdir}"/usr/share/{doc,licenses}/"${pkgname}"/README
}

sha1sums=('61c263d04b743fc2f2a4b00245621d9da19860af')
md5sums=('49ad704f2dddb4fbd258563d2efb181a')
sha256sums=('0e5d42e5472228edca86e263af0d5066a9c1fa8f48f061f48f126abf65558978')

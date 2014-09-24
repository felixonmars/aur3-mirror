# Maintainer: Andreas B. Wagner <AndreasBWagner@pointfree.net>
# Contributor: Florian Léger <florian6 dot leger at laposte dot net>

pkgname=jwasm
_pkgname=JWasm211as
pkgver=2.11a
pkgrel=1
pkgdesc="a free MASM-compatible assembler"
arch=('i686' 'x86_64')
url="http://www.japheth.de/JWasm.html"
license=('custom')
makedepends=('hd2u')
depends=('glibc')
source=("${_pkgname}.zip"::"http://sourceforge.net/projects/jwasm/files/JWasm%20Source%20Code/${_pkgname}.zip/download")
md5sums=('9c53ff1d5ddc63be00a64551a0713933')

build() {
	cd "$srcdir"
	make -f GccUnix.mak
	test -r README.TXT && mv README.TXT Readme.txt
	dos2unix *.txt Doc/*.txt
}

package() {
	cd "${srcdir}"
	mkdir -p ${pkgdir}/usr/bin
	mkdir -p ${pkgdir}/usr/share/{doc,licenses}/jwasm
	install -m755 GccUnixR/jwasm ${pkgdir}/usr/bin/jwasm
	install -m644 History.txt Readme.txt Doc/enh.txt Doc/fixes.txt Doc/gencode.txt Doc/overview.txt ${pkgdir}/usr/share/doc/jwasm/
	install -m644 License.txt ${pkgdir}/usr/share/licenses/jwasm/
}

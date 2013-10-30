# Contributor: Kyro <chris-bos-lee@hotmail.com>
# Contributor: graysky <graysky AT archlinux DOT us>
# Contributor: Josh Miller <josh@joshdmiller.com>
# Contributor: John Gerritse <reaphsharc@gmail.com>
pkgname=celtx-bin-zh-cn
pkgver=2.9.7
pkgrel=1
pkgdesc="Combines full-feature scriptwriting with pre-production support and online collaboration. Precompiled binary version."
arch=('i686' 'x86_64')
url="http://celtx.com"
license=('CePL')
options=('!strip')
conflicts=('celtx')
depends=('libpng12')

if [ "$CARCH" = "i686" ]; then
	source=("http://download.celtx.com/${pkgver}/Celtx-${pkgver}-zh-CN.tar.bz2" 'CePL-1.3.txt' 'celtx.desktop')
	sha256sums=('461650d9d4f90c042907bbed0202da4a40450c1a26cd53be529e0d0581a4be44'
	'2d98ce38f9cce0f553e7dbdc0b387b9f06f341de58678d9ef4a90846b2b0c94f'
	'94b827ed60741a20c5d37d243cbd93a98beaad686c9e4fda01c8b7368b1c5206')
elif [ "$CARCH" = "x86_64" ]; then
	source=("http://download.celtx.com/${pkgver}/Celtx-${pkgver}-zh-CN-64.tar.bz2" 'CePL-1.3.txt' 'celtx.desktop')
	sha256sums=('a5a0709013ae1370fb2cd10815d266c9af04839899cb8ea2d159769074e68148'
	'2d98ce38f9cce0f553e7dbdc0b387b9f06f341de58678d9ef4a90846b2b0c94f'
	'94b827ed60741a20c5d37d243cbd93a98beaad686c9e4fda01c8b7368b1c5206')
fi

package() {
	mkdir -p "${pkgdir}/opt/celtx" "${pkgdir}/usr/bin"
	mv "${srcdir}/celtx" "${pkgdir}/opt"
	ln -s "${pkgdir}/opt/celtx ${pkgdir}/usr/bin/celtx" # in case users run it from a shell
	install -D -m644 "${srcdir}/CePL-1.3.txt" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
	install -D -m644 "${srcdir}/celtx.desktop" "${pkgdir}/usr/share/applications/celtx.desktop"
}

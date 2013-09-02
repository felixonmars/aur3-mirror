# Maintainer: Benjamin Bukowski <benjamin.bukowski@gmail.com>
pkgname=tsmuxer
pkgver=1.10.6
pkgrel=14
pkgdesc='Transport Stream muxer - without its gui'
arch=('i686' 'x86_64')
url="http://www.smlabs.net/tsmuxer_en.html"
license=('custom')
options=('!strip')

depends=('bash')
if [ "$CARCH" == "i686" ]; then
	depends=(${depends} 'gcc-libs' 'freetype2')
else
	depends=(${depends} 'lib32-gcc-libs' 'lib32-freetype2');
fi

source=("tsMuxeR_shared_${pkgver}.tar.gz")
md5sums=('1f2e2a609d1a2dc8808ad3b3641733f7')
install="$pkgname.install"

package() {
	cd $srcdir/
	install -D -m644 licence.txt $pkgdir/usr/share/licenses/${pkgname}/LICENSE
	install -D -m755 tsMuxeR $pkgdir/usr/bin/tsMuxeR
}

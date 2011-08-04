pkgname=aacconverter
pkgver=1.0
pkgrel=1
pkgdesc="Nero AAC encoder GUI"
url="http://docd.zx6.ru"
depends=('java-runtime' 'neroaacenc' 'neroaacdec' 'lame' 'flac')
optdepends=('faad' 'ffmpeg')
license=("unknown")
source=(http://docd.zx6.ru/proj/j2se/AACconverter-${pkgver}.zip)
arch=('any')

package() {
	install -D -m755 "${srcdir}/bin/aacconverter" "${pkgdir}/usr/bin/aacconverter"
	install -D -m644 "${srcdir}/lib/AACconverter.jar" "${pkgdir}/usr/lib/AACconverter/AACconverter.jar"
}
md5sums=('bd6bb19d2486181813de25f04bda6712')

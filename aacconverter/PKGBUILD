pkgname=aacconverter
pkgver=1.0
pkgrel=2
pkgdesc="NeroAacEnc GUI. Converts aac, flac, mp3, m4a, ogg, wav into aac or m4a audio file with given bitrate"
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
md5sums=('6cde7843ece31ad6a89cc91e933a6b63')

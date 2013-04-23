# Maintainer: Magnus Bjerke Vik <mbvett at gmail dot com>
# Contributor: Mymaud <mymaud@gmail.com>

pkgname=bibblepro
_pkgname=bibble5
pkgver=5.2.3
_pkgver=5.2-3
pkgrel=4
pkgdesc="Professional Workflow and RAW Conversion"
arch=('i686' 'x86_64')
license=('custom')

depends=('qt4' 'glib2' 'pcre' 'libpng12' 'libgl' 'glu')
[ "$CARCH" = "x86_64" ] && depends=('lib32-qt4' 'lib32-glib2' 'lib32-pcre' 'lib32-libpng12' 'lib32-libgl' 'lib32-glu')

conflicts=('bibblelite' 'bibble5pro' 'bibble5pro-pv')
source=("http://download.bibblelabs.com/pub/5/${_pkgname}-${_pkgver}.i386.rpm" \
	"LICENSE")
url="http://www.bibblelabs.com"

md5sums=('af3607d6caaab74b2f874b7d29410a1b'
         '6d94c13f40223b03d72f5ef682643525')

package() {
	install -d ${pkgdir}/usr/share/licenses/${pkgname}
	install -D -m644 ${startdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/

	mv  ${srcdir}/opt ${pkgdir}/
	mv  ${srcdir}/usr/bin ${pkgdir}/usr/
	mv  ${srcdir}/usr/share/{applications,pixmaps} ${pkgdir}/usr/share/
}

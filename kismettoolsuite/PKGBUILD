# Maintainer: Max Roder <maxroder@web.de>
# Contributor: nofxx <x@nofxx.com>

pkgname='kismettoolsuite'
pkgver='2.01'
pkgrel='3'
pkgdesc='A couple of command-line tools to analyze, convert and merge Kismet log files (.csv, .gps and .xml).'
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/kismettoolsuite"
license=('GPL')
depends=('bash')
source=("http://sourceforge.net/projects/kismettoolsuite/files/KismetToolSuite/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('e4f6e53c0b3e7a69618fc6b760d4891433a0a4b442310131dd37cd27dbc06eb9')

package() {
	cd ${srcdir}/${pkgname}-v${pkgver}/

	install -d ${pkgdir}/usr/bin ${pkgdir}/usr/share/${pkgname}

	cp -a csv2ns csvviewer mergecsv mergegps mergexml extra/* ${pkgdir}/usr/bin/
	cp -a doc README TODO CHANGELOG ${pkgdir}/usr/share/${pkgname}/
}

# vim:set ts=2 sw=2 et:

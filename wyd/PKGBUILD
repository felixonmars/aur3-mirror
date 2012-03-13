# Maintainer: Max Roder <maxroder@web.de>
# Contributor: nofxx <x@nofxx.com>

pkgname='wyd'
pkgver='0.2'
pkgrel='3'
pkgdesc='Gets keywords from personal files. IT security/forensic tool.'
arch=('any')
url='http://www.remote-exploit.org/codes/wyd'
license=('GPL')
depends=('perl')
optdepends=('perl-openoffice-oodoc: parse OpenDocument files' 
	'catdoc: parse Microsoft Office Files' 
	'jhead: parse jpeg files' 
	'mp3info: parse mp3 files')
source=("http://www.remote-exploit.org/content/${pkgname}-${pkgver}.tar.gz")
sha256sums=('70085fcfa8bfff41d6b6bb4522d9437ad62262ab39fa98d3d8076d54bb06dcb9')
	 
build() {
	cd ${srcdir}/${pkgname}-${pkgver}

	rm -f docs/gpl.txt
	install -d ${pkgdir}/usr/share/${pkgname} ${pkgdir}/usr/bin
	cp -a * ${pkgdir}/usr/share/${pkgname}/
	chmod +x ${pkgdir}/usr/share/${pkgname}/${pkgname}.pl

	ln -sf /usr/share/${pkgname}/${pkgname}.pl ${pkgdir}/usr/bin/${pkgname}
}

# vim:set ts=2 sw=2 et:

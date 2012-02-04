# Contributor: Andreas Hauser <andy-aur@splashground.de>
# Contributor: Stefan Langeland <teffikater@arcor.de>
# Maintainer: Vojtech Horky <vojta . horky at-symbol seznam . cz>
pkgname=sablotron
_pkgname=Sablot
pkgver=1.0.3
pkgrel=2
pkgdesc="Fast, compact and portable XML toolkit implementing XSLT 1.0, DOM Level2 and XPath 1.0"
url="http://sourceforge.net/projects/sablotron/"
arch=('i686' 'x86_64')
license=('MPL' 'GPL')
depends=('expat' 'gcc-libs' 'sh')
source=("http://prdownloads.sourceforge.net/sablotron/${_pkgname}-${pkgver}.tar.gz")
md5sums=('72654c4b832e7562f8240ea675577f5e')

build() {
	cd ${srcdir}/${_pkgname}-${pkgver}
	./configure --prefix=/usr --mandir=/usr/share/man || return 1
	make || return 1
	make DESTDIR=${pkgdir} install || return 1
	# install doc into /usr/share/doc/sablotron/{sablot|sxp}/...
	# instead of /usr/share/doc/html/{sablot|sxp}/...
	mv ${pkgdir}/usr/share/doc/html/ ${pkgdir}/usr/share/doc/sablotron/
}

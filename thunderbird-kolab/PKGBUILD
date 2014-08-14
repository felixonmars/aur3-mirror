# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=thunderbird-kolab
pkgver=3.1.2
pkgrel=1
pkgdesc="Synchronize the address book and calendar with IMAP folder"
arch=('any')
url="http://synckolab.mozdev.org/"
license=('MPL 1.1' 'GPL 2.0' 'LGPL 2.1 ')
depends=('thunderbird')
options=(!strip)

source=(http://downloads.mozdev.org/synckolab/synckolab-${pkgver}.xpi)
sha1sums=('a901b75bbb9d68df5fd2dff0000f7a3a60c4e545')

package() {
	targetdir="${pkgdir}/usr/lib/thunderbird/extensions/{571CFACF-0F7D-49b4-BD77-E6FC7B209ADC}"
	install -d $targetdir
	cd $targetdir
	bsdtar -x -f ${srcdir}/synckolab-${pkgver}.xpi

	# Fix permissions
	find -type d -exec chmod 0755 \{\} \+
	find -type f -exec chmod 0644 \{\} \+
	find -name '*.so' -exec chmod 0755 \{\} \+
}

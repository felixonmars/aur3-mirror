# Contributor: Leonardo A. Gallego <leonardo@archlinux-es.org> <www.archlinux-es.org>

pkgname=firefox2-spell-es_es
pkgver=2.0.0.16
pkgrel=1
pkgdesc="Spanish (Español Neutro) languague dictionary (spellcheker) for Firefox 2"
arch=('i686' 'x86_64')
license=('GPL')
depends=("firefox>=$pkgver")
makedepends=('unzip')
url="http://ftp.services.openoffice.org/pub/OpenOffice.org/contrib/dictionaries/"
source=(http://ftp.services.openoffice.org/pub/OpenOffice.org/contrib/dictionaries/es_ES.zip)
md5sums=('4b272f7c958dd619b2ddc007c45db53b')

build() {
	cd ${startdir}/src

	# Borramos los changelogs y el readme
	rm *.txt
  
	install -D -m644 es_ES.aff ${startdir}/pkg/usr/lib/firefox-${pkgver}/dictionaries/es_ES.aff || return 1
	install -D -m644 es_ES.dic ${startdir}/pkg/usr/lib/firefox-${pkgver}/dictionaries/es_ES.dic || return 1
}



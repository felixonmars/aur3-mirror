# Contributor: Leonardo A. Gallego <leonardo@archlinux-es.org> <www.archlinux-es.org>

pkgname=firefox2-spell-es_ar
pkgver=2.0.0.16
pkgrel=1
pkgdesc="Spanish (Español Argentina) languague dictionary (spellcheker) for Firefox 2"
arch=('i686' 'x86_64')
license=('GPL')
depends=("firefox>=$pkgver")
makedepends=('unzip')
url="http://ftp.services.openoffice.org/pub/OpenOffice.org/contrib/dictionaries/"
source=(http://ftp.services.openoffice.org/pub/OpenOffice.org/contrib/dictionaries/es_AR.zip)
md5sums=('4c634da95fad11093ba65f6367ee5e19')

build() {
	cd ${startdir}/src

	# Borramos los changelogs y el readme
	rm *.txt
  
	install -D -m644 es_AR.aff ${startdir}/pkg/usr/lib/firefox-${pkgver}/dictionaries/es_AR.aff || return 1
	install -D -m644 es_AR.dic ${startdir}/pkg/usr/lib/firefox-${pkgver}/dictionaries/es_AR.dic || return 1
}



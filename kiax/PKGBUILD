# Contributor: Leonardo Andres Gallego <leonardo@archlinux-es.org>
pkgname=kiax
pkgver=2.0
pkgrel=1
pkgdesc="Qt4 based IAX/2 Softphone (binary) - KDE not needed"
arch=('i686' 'x86_64')
url="http://www.forschung-direkt.eu/projects/kiax2/"
license=('GPL')
depends=('iaxclient' 'json-c' 'portaudio' 'lib32-sqlite3')
install=kiax.install
source=(http://downloads.sourceforge.net/kiax/${pkgname}-${pkgver}-static.tar.gz)
md5sums=('33cc38d768abbb34309a6260058a900e')


build()
{

	cd ${startdir}/src/${pkgname}-${pkgver}-static
  
	mkdir -p ${startdir}/pkg/opt/${pkgname}

	install -d ${startdir}/pkg/opt/${pkgname} 
	cp -r icons ${startdir}/pkg/opt/${pkgname}

	install -m755 kiax ${startdir}/pkg/opt/${pkgname}
}


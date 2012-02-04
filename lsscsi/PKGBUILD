# Contributor : XAVeRY - los dot danielos at gmail dot com

pkgname=lsscsi
pkgver=0.25
pkgrel=1
pkgdesc="A tool that lists devices connected via SCSI and its transports"
arch=('i686' 'x86_64')
url="http://sg.danny.cz/scsi/lsscsi.html"
license=('GPL')
depends=('sysfsutils')
source=(http://sg.danny.cz/scsi/${pkgname}-${pkgver}.tgz)
md5sums=('c4e36b106624aff78527c54cf08ecbfe')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	./configure --prefix=/usr
	make || return 1
	make DESTDIR=${pkgdir} install || return 1
}

#Contributor: Evgenij Vdovin <evdovin@pochta.ru>

pkgname=openoffice-dict-uk
pkgver=3.1.1
pkgrel=1
intver=3.0.0
pkgdesc="OOo United Kingdom (uk) dictionary extensions from Infra"
arch=('i686' 'x86_64')
url="http://www.i-rs.ru/"
license=('LGPL')
makedepends=('binutils' 'tar' 'gzip')
source=(http://download.i-rs.ru/pub/openoffice/debian/openoffice.org3-dict-uk_${intver}-9_i386.deb)
md5sums=('1372df01c04a79d9277dd1ab8f8765ab')

build() {
	cd ${pkgdir}
	ar x ${srcdir}/openoffice.org3-dict-uk_${intver}-9_i386.deb data.tar.gz
	tar -xf data.tar.gz
	rm data.tar.gz
	install -d usr/share/openoffice/dict
	install -m 0644 opt/openoffice.org3/share/extension/install/* usr/share/openoffice/dict
	rm -rf opt
}

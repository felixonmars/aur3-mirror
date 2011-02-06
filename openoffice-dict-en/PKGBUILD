#Contributor: Evgenij Vdovin <evdovin@pochta.ru>

pkgname=openoffice-dict-en
pkgver=3.1.1
pkgrel=1
intver=3.0.0
pkgdesc="OOo English (en) dictionary extensions from Infra"
arch=('i686' 'x86_64')
url="http://www.i-rs.ru/"
license=('LGPL')
makedepends=('binutils' 'tar' 'gzip')
source=(http://download.i-rs.ru/pub/openoffice/debian/openoffice.org3-dict-en_${intver}-9_i386.deb)
md5sums=('33ce1c77adb2745326c4154a84c12a03')

build() {
	cd ${pkgdir}
	ar x ${srcdir}/openoffice.org3-dict-en_${intver}-9_i386.deb data.tar.gz
	tar -xf data.tar.gz
	rm data.tar.gz
	install -d usr/share/openoffice/dict
	install -m 0644 opt/openoffice.org3/share/extension/install/* usr/share/openoffice/dict
	rm -rf opt
}

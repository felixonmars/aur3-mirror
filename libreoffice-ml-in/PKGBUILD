# Maintainer: Adam Hani Schakaki (krzd) <krzd@krzd.net>

pkgname=libreoffice-ml-in
pkgver=3.3.0_beta2
pkgrel=1
_lang=ml-IN
pkgdesc="Go-OpenOffice ${_lang} language files"
arch=(any)
url="http://www.documentfoundation.org/download/"
license=(LGPL)
depends=("libreoffice-base")
makedepends=("rpmextract")
source=(http://download.documentfoundation.org/libreoffice/testing/3.3.0-beta2/rpm/x86/LibO_3.3.0_beta2_Linux_x86_langpack-rpm_${_lang}.tar.gz)
md5sums=('f0bf21f3277a265eb46b43bdea2c38fc')
build() {
	cd ${srcdir}/${_lang}/RPMS/
	for i in *.rpm
		do rpmextract.sh $i
	done

	mv opt ${pkgdir}
}


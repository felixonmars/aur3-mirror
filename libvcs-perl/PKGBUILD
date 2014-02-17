# Maintainer: Alexandr Boiko <brdcom@ya.ru>

pkgname=libvcs-perl
_pkgname=libcvs-perl
_basename=libcvs
pkgver=1.1
pkgrel=1
pkgdesc="Perl module for build Bering uClibc"
arch=('any')
url="http://www.ucbering.de/"
license=('Unknown')
options=('!emptydirs')
source=("http://www.ucbering.de/?download=${_pkgname}.tgz")
md5sums=('90decec6527de36ac8bf712d0ad8207a')

build() {
	cd "${srcdir}/${_basename}/Perl"

	# Install module in vendor directories.
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
	make
}

#check() {
#	cd "${srcdir}/${_basename}/Perl"
#	make test
#}

package() {
	cd "${srcdir}/${_basename}/Perl"
	make install DESTDIR="${pkgdir}/"
}

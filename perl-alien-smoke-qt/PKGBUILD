# Maintainer: Ricky Thomson <punkrockunix at gmail dot com

pkgname=perl-alien-smoke-qt
_pkgname=Alien-SmokeQt

pkgver=4.6.0.4
pkgrel=1
pkgdesc="Perl module to provide information about the SmokeQt library"
arch=('any')
url="http://code.google.com/p/perlqt4/"
license=('GPL')
depends=('qt')
makedepends=('cmake')
options=('!emptydirs')

source=(http://perlqt4.googlecode.com/files/${_pkgname}-${pkgver}.tar.gz)
md5sums=('c70e5021856ab78059154111b9ae1eaa')

build() {
	cd ${srcdir}/${_pkgname}-${pkgver}

	PERL_MM_USE_DEFAULT=1 perl Makefile.PL || return 1
	
	cmake   -DWITH_Phonon=OFF \
		-DWITH_QImageBlitz=OFF \
		-DWITH_QScintilla=OFF \
		-DWITH_Qwt5=OFF . || return 1

	make || return 1
	make DESTDIR="${pkgdir}" install || return 1

	find "${pkgdir}" \( -name '.packlist' -o -name 'perllocal.pod' \) -delete
}

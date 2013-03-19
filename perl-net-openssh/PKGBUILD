# Contributor: Alessandro Sagratini <ale_sagra at hotmail dot com>
pkgname=perl-net-openssh
pkgver=0.60
pkgrel=1
pkgdesc="Perl wrapper for OpenSSH secure shell client"
arch=(any)
url=http://search.cpan.org/~salva/Net-OpenSSH/
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0' 'perl-io-tty')
options=(!emptydirs)
changelog=Changes
source=(http://search.cpan.org/CPAN/authors/id/S/SA/SALVA/Net-OpenSSH-$pkgver.tar.gz)
md5sums=('020241217103e8b7ad1704136d5a2d4f')

build() {
	cd "$srcdir/Net-OpenSSH-$pkgver"

	# install module in vendor directories.
	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1
	make || return 1
}

package() {
	cd "$srcdir/Net-OpenSSH-$pkgver"
	make install DESTDIR=${pkgdir} || return 1
	# remove perllocal.pod and .packlist
	find "$pkgdir" -name perllocal.pod -delete
	find "$pkgdir" -name .packlist -delete
}

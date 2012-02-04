# Contributor: Heikki Mehtänen <heikki at mehtanen dot fi>

pkgname=perl-config-options
_realname=Config-Options
pkgver=0.08
pkgrel=1
pkgdesc="Module to provide a configuration hash with option to read from file."
arch=('i686' 'x86_64')
url="http://search.cpan.org/dist/${_realname}/"
license=('PerlArtistic')
depends=('perl>=5.10.0')
options=('!emptydirs')
source=(http://search.cpan.org/CPAN/authors/id/E/EA/EALLENIII/${_realname}-$pkgver.tar.gz)
md5sums=('8167ac68027279959ec8152d3fd44bd3')

build() {
	cd $srcdir/${_realname}-$pkgver

	# install module in vendor directories
	perl Makefile.PL INSTALLDIRS=vendor || return 1
	make || return 1
	make DESTDIR=$pkgdir install || return 1
	
	# remove perllocal.pod and .packlist
	find $pkgdir -name perllocal.pod -delete
	find $pkgdir -name .packlist -delete
}

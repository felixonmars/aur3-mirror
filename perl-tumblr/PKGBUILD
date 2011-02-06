# Contributor: André Gomes <ponto@algohumano.net>

pkgname=perl-tumblr
pkgver=2.01
pkgrel=1
pkgdesc="WWW::Tumblr - Perl interface for the Tumblr API"
url='http://search.cpan.org/dist/WWW-Tumblr/lib/WWW/Tumblr.pm'
license=('GPL')
depends=('perl')
arch=('i686' 'x86_64')
source=(http://search.cpan.org/CPAN/authors/id/D/DA/DAMOG/WWW-Tumblr-3.tar.gz)
md5sums=('485698dc753b25396f50f36eb5588637')

build() {
	cd $startdir/src/WWW-Tumblr-3
	perl Makefile.PL
	make || return 1
	make DESTDIR=$startdir/pkg/ install

	/usr/bin/find $startdir/pkg -name '.packlist' -exec rm '{}' \;
	/usr/bin/find $startdir/pkg -name 'perllocal.pod' -exec rm '{}' \;
}

	    # vim:set ts=2 sw=2 et:


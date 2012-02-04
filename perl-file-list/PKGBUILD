# Contributor: Heikki Mehtänen <heikki at mehtanen dot fi>

pkgname=perl-file-list
_realname=File-List
pkgver=0.3.1
pkgrel=1
pkgdesc="Perl/CPAN File::List extension for crawling directory trees and compiling lists of files"
arch=('i686' 'x86_64')
url="http://search.cpan.org/dist/${_realname}/"
license=('PerlArtistic')
depends=('perl>=5.10.0')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/D/DO/DOPACKI/${_realname}-$pkgver.tar.gz)
md5sums=('0fdefea8d6dffabc3c2244ea0c627c50')

build() {
	cd $srcdir/File/List
	# quick, magic sed to fix bug with symlinks in List.pm
	# http://rt.cpan.org/Public/Bug/Display.html?id=41493
	sed -i -e '73s/if (-d "$base\/$entry") {/if (-d "$base\/$entry" and not -l "$base\/$entry") {/' List.pm

	# install module in vendor directories
	perl Makefile.PL INSTALLDIRS=vendor || return 1
        make || return 1
        make DESTDIR=$pkgdir install || return 1
	
	# remove perllocal.pod and .packlist
	find $pkgdir -name perllocal.pod -delete
	find $pkgdir -name .packlist -delete
}

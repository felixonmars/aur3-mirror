# Maintainer: Chris Clonch <chris at theclonchs dot com>
# Contributor: Chris Clonch <chris at theclonchs dot com>
# https://github.com/cacack/pkgbuilds/tree/master/perl-roman

pkgname=perl-roman
pkgver=1.23
pkgrel=1
pkgdesc="Perl module for conversion between Roman and Arabic numerals."
_dist=Roman
arch=('any')
url="http://search.cpan.org/dist/$_dist"
license=('Artistic1.0')
options=('!emptydirs')
depends=(
         'perl'
        )
makedepends=(
            )
source=("http://search.cpan.org/CPAN/authors/id/C/CH/CHORNY/$_dist-$pkgver.zip")
sha512sums=('20a2a9f3961317438b9f761bdcf16c582f57e5efe9b6c869b6170f19615f300e467f3ab555861c83e8c7930ae024381a46da64cd80002a26cae1f2d315759f74')

build() {
   cd "$srcdir/$_dist-$pkgver"
   unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
   export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
   /usr/bin/perl Makefile.PL
   make
}

check() {
	cd "$srcdir/$_dist-$pkgver"
   cd "$srcdir/$_dist-$pkgver"
   unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
   export PERL_MM_USE_DEFAULT=1
   make test
}

package() {
   cd "$srcdir/$_dist-$pkgver"
   unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
   make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}

# Maintainer: Chris Clonch <chris at theclonchs dot com>
# Contributor: Chris Clonch <chris at theclonchs dot com>
# https://github.com/cacack/pkgbuilds/tree/master/perl-gedcom

pkgname=perl-gedcom
pkgver=1.19
pkgrel=1
pkgdesc="Gedcom - Interface to genealogy GEDCOM files."
_dist=Gedcom
arch=('any')
url="http://search.cpan.org/dist/$_dist"
license=('Artistic1.0')
options=('!emptydirs')
depends=(
         'perl'
         'perl-date-manip'
         'perl-parse-recdescent'
         'perl-roman'
         'perl-text-soundex'
        )
makedepends=(
            )
source=("http://search.cpan.org/CPAN/authors/id/P/PJ/PJCJ/$_dist-$pkgver.tar.gz")
sha512sums=('ea1ce2dabbc3c715b86cb497aa4c6a8ab353bb3e907c14fafd17b9dab14b9f6e1406a00ac93aec3493b2a9fbff13b803e661a6c12b3812140ed263d2ab47842f')

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

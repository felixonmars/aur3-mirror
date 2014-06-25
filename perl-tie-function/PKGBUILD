# Maintainer: Chris Clonch <chris at theclonchs dot com>
# Contributor: Chris Clonch <chris at theclonchs dot com>

pkgname=perl-tie-function
pkgver=0.02
pkgrel=1
pkgdesc="Tie::Function - wrap functions in tied hash sugar"
_dist=Tie-Function
arch=('any')
url="http://search.cpan.org/dist/$_dist"
license=('unknown')
options=('!emptydirs')
depends=(
         'perl'
        )
makedepends=(
            )
source=("http://search.cpan.org/CPAN/authors/id/D/DA/DAVIDNICO/handy_tied_functions/$_dist-$pkgver.tar.gz")
sha512sums=('d546552f49cfde4f44fc05387e4964b712cee4308a85ee949b64a348b5b60412fc3bebb0cfd90ab8acffb0248ac40ca3dd9379abccd564907ec9dbbc6fef4bb7')

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

# Contributor: Chris Clonch <chris at theclonchs dot com>

pkgname=perl-perl6-slurp
pkgver=0.051005
pkgrel=1
pkgdesc="Perl6::Slurp - Implements the Perl 6 'slurp' built-in"
_dist=Perl6-Slurp
arch=('any')
url="http://search.cpan.org/dist/$_dist"
license=('Artistic2.0')
options=('!emptydirs')
depends=(
         'perl'
        )
makedepends=(
            )
source=("http://search.cpan.org/CPAN/authors/id/D/DC/DCONWAY/$_dist-$pkgver.tar.gz")
md5sums=('6095c8df495c7983f36996ed78c5ead7')
sha1sums=('9a78401040cf0dd8c87868e2eed175203bd651bb')
sha256sums=('0e0ceb30495ecf64dc6cacd12113d604871104c0cfe153487b8d68bc9393d78f')
sha512sums=('1b5d1a63e084447f87d01479270457b6f7943e976b5e9a180510adb236575198738031811735dcd11d3bb71ccce9b8211d4a1a224c6fed6f7c6577455088e17f')


build() {
   cd "$srcdir/$_dist-$pkgver"
   unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
   export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
   /usr/bin/perl Makefile.PL
   make
}

check() {
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

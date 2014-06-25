# Maintainer: Chris Clonch <chris at theclonchs dot com>
# Contributor: Chris Clonch <chris at theclonchs dot com>

pkgname=perl-xml-tiny
pkgver=2.06
pkgrel=1
pkgdesc="XML::Tiny - simple lightweight parser for a subset of XML"
_dist=XML-Tiny
arch=('any')
url="http://search.cpan.org/dist/$_dist"
license=('unknown')
options=('!emptydirs')
depends=(
         'perl'
        )
makedepends=(
            )
source=("http://search.cpan.org/CPAN/authors/id/D/DC/DCANTRELL/$_dist-$pkgver.tar.gz")
md5sums=('1f8227813ee3a536126c5b8828525384')
sha1sums=('a71fe35f975474d3aa1862556cd5dc018ca04815')
sha256sums=('d2ca40496b96f6ff08e4f858c3a813a081983f5b5aa6ae76357e2b9a88886eea')
sha512sums=('4ae648eaeedaddac4e1a32f3c9ab374350217b3db2adc4a68fe8d067cbf3ab2b517dcb5043621f89daf48c56ac7b237dcd23efae6077de612c103a9380c8c4b7')

build() {
   cd "$srcdir/$_dist-$pkgver"
   unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
   export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
   /usr/bin/perl Makefile.PL
   make
	#perl Build.PL installdirs=vendor destdir="$pkgdir/"
	#perl Build
}

check() {
   cd "$srcdir/$_dist-$pkgver"
   unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
   export PERL_MM_USE_DEFAULT=1
   make test
	#perl Build test
}

package() {
   cd "$srcdir/$_dist-$pkgver"
   unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
   make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
	#perl Build install
}

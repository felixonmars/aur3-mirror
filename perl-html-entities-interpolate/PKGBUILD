# Maintainer: Chris Clonch <chris at theclonchs dot com>
# Contributor: Chris Clonch <chris at theclonchs dot com>

pkgname=perl-html-entities-interpolate
pkgver=1.05
pkgrel=1
pkgdesc="HTML::Entities::Interpolate - Call HTML::Entities::encode_entities, via a hash, within a string"
_dist=HTML-Entities-Interpolate
arch=('any')
url="http://search.cpan.org/dist/$_dist"
license=('Artistic2.0')
options=('!emptydirs')
depends=(
         'perl'
         'perl-html-parser'
         'perl-tie-function'
        )
makedepends=(
            )
source=("http://search.cpan.org/CPAN/authors/id/R/RS/RSAVAGE/$_dist-$pkgver.tgz")
md5sums=('ba1dbb354a38fbc3856b8a56e5ad1a30')
sha1sums=('5081c87557a6c1f9ae63294d2559da3779258e6a')
sha256sums=('f5c0199c72acb65f7ea158698fa8dc13c1cd4d64b8ba657a2e18e93d859b1f81')
sha512sums=('b9f7565b9d66f1505266d0050d6e7ad0eadfe11d6385fa07aac4fda1908c3629806a5eb200a9223aec43dd9b56e42bc238f363714f07afe43940d1192ca37625')

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

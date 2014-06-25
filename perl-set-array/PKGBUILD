# Maintainer: Chris Clonch <chris at theclonchs dot com>
# Contributor: Chris Clonch <chris at theclonchs dot com>

pkgname=perl-set-array
pkgver=0.30
pkgrel=2
pkgdesc="Set::Array - Arrays as objects with lots of handy methods"
_dist=Set-Array
arch=('any')
url="http://search.cpan.org/dist/$_dist"
license=('Artistic2.0')
options=('!emptydirs')
depends=(
         'perl'
         'perl-try-tiny'
         'perl-want>=0.23'
        )
makedepends=(
             'perl-test-deep'
            )
source=("http://search.cpan.org/CPAN/authors/id/R/RS/RSAVAGE/$_dist-$pkgver.tgz")
md5sums=('e8f61d07def3f25c1ad39dfc7e34b3f7')
sha1sums=('750c3baff450012a5661c88ad042a50ab9355952')
sha256sums=('d9f024c8e3637feccdebcf6479b6754b6c92f1209f567feaf0c23818af31ee3c')
sha512sums=('5370447e65addbb5778b36e89d95cb209b9b3633034910af1f61a3dab6633ff77e3b75278f659750f27658e8e7adbf2a7a730f24662182f9b2810e7cfbaf0a7a')


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

# Maintainer: Chris Clonch <chris at theclonchs dot com>
# Contributor: Chris Clonch <chris at theclonchs dot com>

pkgname=perl-test-version
pkgver=1.002004
pkgrel=2
pkgdesc="Test::Version - Check to see that version's in modules are sane"
_dist=Test-Version
arch=('any')
url="http://search.cpan.org/dist/$_dist"
license=('Artistic2.0')
options=('!emptydirs')
depends=(
         'perl'
         'perl-file-find-rule-perl'
        )
makedepends=(
             'perl-test-tester'
             'perl-test-exception'
            )
source=("http://search.cpan.org/CPAN/authors/id/X/XE/XENO/$_dist-$pkgver.tar.gz")
md5sums=('58d140bdfbed940453da85e9a73145c8')
sha1sums=('a3e65a7734be4bbb03168c35e07716a0fa466a18')
sha256sums=('fb41be1d9cd46645883cffa406194fe5b59ff71b0b97bccad43a9510cd0d6fd3')
sha512sums=('97ab82c10dd74e8bb62c0d98edb48294b93abe807240385634c5e8b5dfe252ccb3fb7282ca53fb16e06390f1c5bc2d75db0507f613b1f845c5a43d41982db755')

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

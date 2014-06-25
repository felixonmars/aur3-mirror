# Maintainer: Chris Clonch <chris at theclonchs dot com>
# Contributor: Jason St. John <jstjohn .. purdue . edu>

pkgname=perl-graphviz2
pkgver=2.28
pkgrel=2
pkgdesc="GraphViz2 - A wrapper for AT&T's Graphviz"
_dist=GraphViz2
arch=('any')
url="http://search.cpan.org/dist/$_dist"
license=('Artistic2.0')
options=('!emptydirs')
depends=(
         'graphviz'
         'perl'
         'perl-algorithm-dependency'
         'perl-capture-tiny'
         'perl-class-isa'
         'perl-class-load'
         'perl-data-section-simple'
         'perl-date-simple'
         'perl-dbi'
         'perl-file-homedir'
         'perl-file-slurp'
         'perl-file-temp'
         'perl-file-which'
         'perl-html-entities-interpolate'
         'perl-html-tree'
         'perl-ipc-run3'
         'perl-log-handler'
         'perl-moo'
         'perl-parse-recdescent'
         'perl-perl6-slurp'
         'perl-set-array'
         'perl-text-xslate'
         'perl-tree-dag-node'
         'perl-try-tiny'
         'perl-xml-bare'
         'perl-xml-tiny'
         )
makedepends=(
             'perl-module-build'
             'perl-test-version'
             )
source=("http://search.cpan.org/CPAN/authors/id/R/RS/RSAVAGE/$_dist-$pkgver.tgz")
sha512sums=('5f503fe8eac4c57afbc9db8848c372fb0d8c2fd88f64d61daac8b755b2f0c74ebc4bd7c329dd7a921c053fd164b1bbfd37bee2dd028c12a76d35131a9c6ff46a')

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

# Contributor: Andreas B. Wagner <AndreasBWagner@pointfree.net>
pkgname=perl-graph-readwrite
pkgver=2.04
pkgrel=1
pkgdesc='A collection of classes for reading and writing directed graphs in a variety of file formats.'
arch=('any')
url='http://search.cpan.org/dist/Graph-ReadWrite/'
license=('unknown')
depends=('perl>=5.10.0' 'perl-graph' 'perl-xml-parser' 'perl-xml-writer')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("http://search.cpan.org/CPAN/authors/id/N/NE/NEILB/Graph-ReadWrite-$pkgver.tar.gz")
md5sums=('479890bcdf4785d50b101ae85d1bd824')

package() {
  cd "$srcdir/Graph-ReadWrite-$pkgver"
  
  # Setting these env variables overwrites any command-line-options we don't want...
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  # If using Makefile.PL
  { /usr/bin/perl Makefile.PL &&
    make &&
#    make test &&
    make install; } || return 1

  # remove perllocal.pod and .packlist
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
# vim:set ts=2 sw=2 et:

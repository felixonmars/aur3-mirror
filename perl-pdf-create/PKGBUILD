# Maintainer: Naoki Kawakami <nkawakami atto parallels dotto com>
# Module author: Markus Baertschi
# Contributor: sportscliche <mph at sportscliche dot com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-pdf-create'
pkgver='1.10'
pkgrel='1'
pkgdesc="create PDF files"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
checkdepends=('perl-test-leaktrace>=0.14')
url='http://search.cpan.org/dist/PDF-Create'
source=('http://search.cpan.org/CPAN/authors/id/S/SZ/SZABGAB/PDF-Create-1.10.tar.gz')
md5sums=('83bed42d9603f1027aea180b693d680b')
sha512sums=('06390810d1512811c38a9709f72b25f23ae33f6f08bc337fba048e4e1dd07f69f2885f7f37803850939d78373106c855f9424d20313e7d36cfe43d423a96d5b0')
_distdir="PDF-Create-1.10"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_distdir"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:

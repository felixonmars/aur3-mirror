pkgname=perl-text-pdf
pkgver=0.29a
pkgrel=1
pkgdesc="Module for manipulating PDF files"
arch=('i686' 'x86_64')
url="http://search.cpan.org/dist/Text-PDF/"
license=('PerlArtistic' 'GPL')
source=('http://search.cpan.org/CPAN/authors/id/M/MH/MHOSKEN/Text-PDF-0.29a.tar.gz')
md5sums=('2fdf4c3170e53a083715888237914a9b')
sha256sums=('9ab04da154c1c5c0beda650d8ae7eb4b31099ec0e28cc4fc3f25e9bbd1785186')
provides=('perl-text-pdf-array' 'perl-text-pdf-bool' 'perl-text-pdf-dict' 'perl-text-pdf-file=0.27' 'perl-text-pdf-filter' 'perl-text-pdf-name' 'perl-text-pdf-null' 'perl-text-pdf-number' 'perl-text-pdf-objind' 'perl-text-pdf-page' 'perl-text-pdf-pages' 'perl-text-pdf-sfont' 'perl-text-pdf-string' 'perl-text-pdf-ttfont' 'perl-text-pdf-ttfont0' 'perl-text-pdf-utils')
options=(!emptydirs)

build() {
  _dir=$(find $srcdir -maxdepth 2 -type f -name 'Makefile.PL')
  if [ ! -z "$_dir" ]; then
    cd $(dirname "$_dir")
    PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1
    make  || return 1
    make install DESTDIR="${pkgdir}" || return 1

  else
  _dir=$(find $srcdir -maxdepth 2 -type f -name 'Build.PL')
  if [ ! -z "$_dir" ]; then
    cd $(dirname "$_dir")
    PERL_MM_USE_DEFAULT=1 perl Build.PL INSTALLDIRS=vendor || return 1
    ./Build  || return 1
    ./Build install destdir=${pkgdir} || return 1

  else
    echo "error: failed to detect build method for $pkgname"
    echo "you may be able to fix this by editing the PKGBUILD"
    return 1
  fi fi

  # remove perllocal.pod and .packlist
  find ${pkgdir} -name perllocal.pod -delete
  find ${pkgdir} -name .packlist -delete
}

# vim:set ts=2 sw=2 et:


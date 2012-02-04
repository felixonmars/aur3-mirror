pkgname=perl-pdf-reuse-barcode
pkgver=0.06
pkgrel=1
pkgdesc="Create barcodes for PDF documents with PDF::Reuse"
arch=('i686' 'x86_64')
url="http://search.cpan.org/dist/PDF-Reuse-Barcode/"
license=('PerlArtistic' 'GPL')
source=('http://search.cpan.org/CPAN/authors/id/L/LA/LARSLUND/PDF-Reuse-Barcode-0.05.tar.gz')
md5sums=('87b3c909e5c3adfacdea4a75d5a3e77a')
sha256sums=('9fe978165c4e87e2d408fb9f03816120c0fab619195bf05ea70e731b8af90d62')
options=(!emptydirs)
depends=('perl-barcode-code128' 'perl-gd-barcode' 'perl-gd-barcode-code39' 'perl-gd-barcode-coop2of5' 'perl-gd-barcode-ean13' 'perl-gd-barcode-ean8' 'perl-gd-barcode-iata2of5' 'perl-gd-barcode-industrial2of5' 'perl-gd-barcode-itf' 'perl-gd-barcode-matrix2of5' 'perl-gd-barcode-nw7' 'perl-gd-barcode-upca' 'perl-gd-barcode-upce' 'perl-pdf-reuse')

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


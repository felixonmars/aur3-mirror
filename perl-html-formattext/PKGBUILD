# Maintainer: Andre Wayand <aur-perl-html-formattext@awayand.sleepmail.com>
_author='Nigel Metheringham'
_perlmod='html-formattext'
pkgname=perl-$_perlmod
pkgver='2.10'
pkgrel=1
pkgdesc="Format HTML as plaintext"
arch=('any')
url="http://search.cpan.org/~$_author/$_perlmod-$pkgver/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0'
'perl-file-slurp'
'perl-font-afm'
)
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(
  "http://search.cpan.org/CPAN/authors/id/N/NI/NIGELM/HTML-Format-$pkgver.tar.gz"
)

build() {
  cd "$srcdir/HTML-Format-$pkgver"
  
  ## Install module in vendor directories.
  #PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  #make

  # For packages with Build.PL, do this instead:
   perl Build.PL installdirs=vendor destdir="$pkgdir/"
   perl Build
}

package() {
  cd "$srcdir/HTML-Format-$pkgver"
  #make install DESTDIR="$pkgdir/"

  # For packages with Build.PL, do this instead:
   perl Build install
}

md5sums=('34831ec506eaa8a7ad5da698224cf58d')

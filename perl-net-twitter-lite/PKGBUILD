# Maintainer: Albert Chang <albert.chang@gmx.com>

_author=mmims
_perlmod=Net-Twitter-Lite
pkgname=perl-net-twitter-lite
pkgver=0.12006
pkgrel=1
pkgdesc="A perl interface to the Twitter API"
arch=('any')
url="http://search.cpan.org/~$_author/$_perlmod-$pkgver/"
license=('GPL' 'PerlArtistic')
#depends=('perl>=5.005' 'perl-crypt-ssleay>=0.5' 'perl-json-any>=2.02' 'perl-lwp-protocol-https>=2.032' 'perl-net-http' 'perl-net-netrc' 'perl-uri>=1.40')
depends=('perl>=5.005' 'perl-crypt-ssleay>=0.5' 'perl-json>=2.02' 'perl-lwp-protocol-https>=2.032' 'perl-net-http' 'perl-uri>=1.40')
provides=('perl-net-twitter-lite')
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/M/MM/MMIMS/$_perlmod-$pkgver.tar.gz")
md5sums=('41a7d537a8efada2d9c855a70152c0d2')

build() {
  cd "$srcdir/$_perlmod-$pkgver"
  pwd

  # Install module in vendor directories.
  #PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  #make

  ## For packages with Build.PL, do this instead:
  perl Build.PL installdirs=vendor destdir="$pkgdir/"
  perl Build
}

package() {
  cd "$srcdir/$_perlmod-$pkgver"
  #make install DESTDIR="$pkgdir/"

  ## For packages with Build.PL, do this instead:
  perl Build install
}

# vim:set ts=2 sw=2 et:

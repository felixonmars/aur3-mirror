# Maintainer : Nicolas Guillaumin <nicolas plus archlinux at guillaumin dot me>
_perlmod=Net-Graphite
_modnamespace=Net
pkgname=perl-net-graphite
pkgver=0.11
pkgrel=1
pkgdesc="Perl Interface to Graphite"
arch=(i686 x86_64 armv7h)
url="http://search.cpan.org/dist/$_perlmod"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0')
options=('!emptydirs')
source=("http://cpan.perl.org/modules/by-module/$_modnamespace/$_perlmod-$pkgver.tar.gz")
md5sums=(fd79830836170f8bc58355119d33737a)

build() {
  cd "$srcdir/$_perlmod-$pkgver"

  # Install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make

}

package() {
  cd "$srcdir/$_perlmod-$pkgver"
  make install DESTDIR="$pkgdir/"
}

# vim:set ts=2 sw=2 et:

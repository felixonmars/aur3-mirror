# Contributor: Your Name <youremail@domain.com>
pkgname=perl-mechanize-formfiller
pkgver=0.10
pkgrel=1
pkgdesc="framework to automate HTML forms"
arch=('i686' 'x86_64')
url="http://search.cpan.org/~corion/WWW-Mechanize-FormFiller-0.10"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.6.0')
makedepends=()
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/C/CO/CORION/WWW-Mechanize-FormFiller-${pkgver}.tar.gz)
md5sums=('9d92ec563d1e98ef95a100d81d7c454a')

build() {
  cd "$srcdir/WWW-Mechanize-FormFiller-$pkgver"

  # install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1
  make install DESTDIR="$pkgdir/" || return 1

  # remove perllocal.pod and .packlist
  find "$pkgdir" -name perllocal.pod -delete
  find "$pkgdir" -name .packlist -delete
}

# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.06

pkgname='perl-gpg'
pkgver='0.06'
pkgrel='2'
pkgdesc="A Perl2GnuPG interface"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
url='http://search.cpan.org/dist/GPG'
source=('http://search.cpan.org/CPAN/authors/id/M/MI/MILES/GPG-0.06.tar.gz')
md5sums=('be78c7a9f0235bcd7d3d1391c8900cf6')

build() {
  cd "$srcdir/GPG-0.06"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/GPG-0.06"
  PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "$srcdir/GPG-0.06"
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name '.packlist' -o -name '*.pod' -delete
}

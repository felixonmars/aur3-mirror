# Contributor: James Pearson <james.m.pearson+arch@gmail.com>

pkgname=perl-xml-parser-easytree
pkgver=0.01
pkgrel=2
pkgdesc="XML::Parser::EasyTree - Easier tree style for XML::Parser"
arch=('i686' 'x86_64')
url="http://search.cpan.org/~ebohlman/XML-Parser-EasyTree/"
license=('PerlArtistic')
depends=('perl>=5.004')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/E/EB/EBOHLMAN/XML-Parser-EasyTree-$pkgver.tar.gz)
md5sums=('f5221737a572a97b3187dade3a1f4191')

build() {
  cd "$srcdir/XML-Parser-EasyTree-$pkgver"

  # install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1
  make install DESTDIR="$pkgdir/" || return 1

  # remove perllocal.pod and .packlist
  find "$pkgdir" -name perllocal.pod -delete
  find "$pkgdir" -name .packlist -delete
}


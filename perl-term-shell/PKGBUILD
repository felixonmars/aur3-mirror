# Maintainer: Liganic <liganic-aur@gmx.org>

pkgname=perl-term-shell
pkgver=0.03
pkgrel=1
pkgdesc="Perl/CPAN Module Term::Shell"
arch=("any")
url="http://search.cpan.org/dist/Term-Shell"
license=("unknown")
depends=("perl-term-readline" "perl-text-autoformat")
source=("http://search.cpan.org/CPAN/authors/id/S/SH/SHLOMIF/Term-Shell-$pkgver.tar.gz")
sha1sums=('6d72200f63b71638597bfe02f82e96823373d051')

build() {
  cd $srcdir/Term-Shell-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1
  make install DESTDIR=$pkgdir || return 1
  find $pkgdir -name '.packlist' -delete
  find $pkgdir -name '*.pod' -delete
}

# Maintainer: milki <milki@rescomp.berkeley.edu>

_author='PEVANS'
_perlmod='Term-TermKey'
pkgname=perl-term-termkey
pkgver='0.16'
pkgrel='1'
pkgdesc='perl wrapper around libtermkey'
arch=('x86_64 i386')
url='https://metacpan.org/module/Term::TermKey'
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-alien-libtermkey>=0.16' 'perl-module-build' 'perl-extutils-pkgconfig')
options=('!emptydirs !libtool')

source=('http://cpan.metacpan.org/authors/id/P/PE/PEVANS/Term-TermKey-0.16.tar.gz')

sha256sums=('0e8672b996b3566fbcea40fdb9a3586ff326c4a692ca7d1e973a9f6d065668a6')

build() {
  cd "$srcdir/$_perlmod-$pkgver"
  perl Build.PL installdirs=vendor destdir="$pkgdir/"
  perl Build

}

package() {
    cd "$srcdir/$_perlmod-$pkgver"
    find . -name .packlist -o -name perllocal.pod -delete
    perl Build install;
}

# Contributor: Konrad Borowski <glitchmr@myopera.com>
# Contributor: Alan Young <harleypig@gmail.com>

pkgname=perl-b-utils
pkgver=0.21
pkgrel=3
pkgdesc='Helper functions for op tree manipulation'
arch=('i686' 'x86_64')
url='http://search.cpan.org/dist/B-Utils'
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0' 'perl-task-weaken')
makedepends=('perl-extutils-depends>=0.301')
provides=()
conflicts=()
replaces=()
backup=()
options=('!emptydirs')
install=
source=("http://search.cpan.org/CPAN/authors/id/J/JJ/JJORE/B-Utils-$pkgver.tar.gz")
md5sums=('5e6af42f436918253137d367b52478cd')

package() {
  cd "$srcdir/"*
  
  # Setting these env variables overwrites any command-line-options we don't want...
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  # If using Makefile.PL
  { /usr/bin/perl Makefile.PL &&
    make &&
    make test &&
    make install; } || return 1
}

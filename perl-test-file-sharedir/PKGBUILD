# Maintainer: Konrad Borowski <glitchmr@myopera.com>
pkgname=perl-test-file-sharedir
pkgver=0.3.1
pkgrel=1
pkgdesc='Create a Fake ShareDir for your modules for testing'
arch=('any')
url='https://metacpan.org/module/Test::File::ShareDir'
license=('GPL' 'PerlArtistic')
depends=('perl-file-copy-recursive'
'perl-file-sharedir>=1.00'
'perl-file-temp')
makedepends=('perl-test-fatal')
provides=()
conflicts=()
replaces=()
backup=()
options=('!emptydirs')
install=
source=("http://search.cpan.org/CPAN/authors/id/K/KE/KENTNL/Test-File-ShareDir-$pkgver.tar.gz")
md5sums=('46fedc77074205c374764c475a0d2815')

build() {
  cd "$srcdir/Test-File-ShareDir-$pkgver"

  # Setting these env variables overwrites any command-line-options we don't want...
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  { /usr/bin/perl Build.PL &&
    ./Build &&
    ./Build test &&
    ./Build install; } || return 1
}

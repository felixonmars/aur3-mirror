 # Maintainer: Konrad Borowski <glitchmr@myopera.com>
pkgname=perl-dist-zilla-plugin-github
pkgver=0.30
pkgrel=1
pkgdesc="Plugins to integrate Dist::Zilla with GitHub"
arch=('any')
url='https://metacpan.org/module/Dist::Zilla::Plugin::GitHub'
license=('GPL' 'PerlArtistic')
depends=('perl-class-load'
'perl-dist-zilla'
'perl-git-wrapper'
'perl-http-tiny'
'perl-io-socket-ssl>=1.56'
'perl-json'
'perl-mime-base64'
'perl-moose'
'perl-term-readkey'
'perl-try-tiny')
makedepends=('perl-file-temp')
provides=()
conflicts=()
replaces=()
backup=()
options=('!emptydirs')
install=
source=("http://search.cpan.org/CPAN/authors/id/A/AL/ALEXBIO/Dist-Zilla-Plugin-GitHub-$pkgver.tar.gz")
md5sums=('44c50f964163187a72ba4e42ae7f16bd')

build() {
  cd "$srcdir/Dist-Zilla-Plugin-GitHub-$pkgver"

  # Setting these env variables overwrites any command-line-options we don't want...
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  { /usr/bin/perl Makefile.PL &&
    make &&
    make test &&
    make install; } || return 1
}

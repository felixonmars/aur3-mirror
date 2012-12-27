# Maintainer: Konrad Borowski <glitchmr@myopera.com>
pkgname=perl-www-github-gist
pkgver=0.17
pkgrel=1
pkgdesc="Perl interface to the GitHub's pastebin service"
arch=('any')
url='http://search.cpan.org/dist/WWW-GitHub-Gist'
license=('GPL' 'PerlArtistic')
depends=('perl>=5.06.2'
'perl-http-tiny'
'perl-json'
'perl-mime-base64'
'perl-moo')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=('!emptydirs')
install=
source=("http://search.cpan.org/CPAN/authors/id/A/AL/ALEXBIO/WWW-GitHub-Gist-$pkgver.tar.gz")
md5sums=('80fef4c8be5150c15a9884b6b23986aa')

build() {
  cd "$srcdir/WWW-GitHub-Gist-$pkgver"
  
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

 # Maintainer: Konrad Borowski <glitchmr@myopera.com>
pkgname=perl-dist-zilla-plugin-changelogfromgit
pkgver=0.006
pkgrel=1
pkgdesc="Write a Changes file from a project's git log"
arch=('any')
url='https://metacpan.org/module/Dist::Zilla::Plugin::ChangelogFromGit'
license=('GPL' 'PerlArtistic')
depends=('perl-datetime>=0.66'
'perl-dist-zilla>=4.000000'
'perl-git-repository>=1.22'
'perl-moose-autobox>=0.11'
'perl-software-release>=0.01')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=('!emptydirs')
install=
source=("http://search.cpan.org/CPAN/authors/id/R/RC/RCAPUTO/Dist-Zilla-Plugin-ChangelogFromGit-$pkgver.tar.gz")
md5sums=('c3e6c39d0aab99401b0f52ce5006f914')

build() {
  cd "$srcdir/Dist-Zilla-Plugin-ChangelogFromGit-$pkgver"

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

# Maintainer: Philipp Überbacher <murks@lavabit.com>
pkgname=nama
pkgver=1.078
pkgrel=1
pkgdesc="Tk/CLI frontend for ecasound"
arch=('any')
url="http://freeshell.de/~bolangi/cgi1/nama.cgi/00home.html"
license=('PerlArtistic' 'GPL')
depends=('perl>=5.10.0' 'ladspa' 'ecasound' 'perl-anyevent>=5'
'perl-event' 'perl-parse-recdescent' 'perl-data-section'
'perl-file-find-rule' 'perl-modern-perl' 'perl-term-readline-gnu'
'perl-file-homedir' 'perl-yaml-tiny' 'perl-file-slurp'
'perl-file-copy-link' 'perl-graph' 'perl-text-format'
'perl-params-util' 'perl-audio-ecasound' 'perl-tk')
makedepends=()
provides=('perl-audio-nama')
conflicts=('nama-git')
optdepends=()
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/G/GA/GANGLION/Audio-Nama-$pkgver.tar.gz")
md5sums=('b7be3327a391b1b9e7b9f5c19bc0aa6b')

build() {
  cd "$srcdir/Audio-Nama-$pkgver"

  # Setting these env variables overwrites any command-line-options we don't want...

  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  # If using Makefile.PL
  { perl Makefile.PL &&
    make &&
    make test &&
    make install; }

  # remove perllocal.pod and .packlist
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

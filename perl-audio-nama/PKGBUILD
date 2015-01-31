# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-audio-nama'
pkgver='1.203'
pkgrel='1'
pkgdesc=""
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('ladspa' 'git' 'ecasound' 'perl-anyevent>=5.0' 'perl-anyevent-termkey' 'perl-data-dumper-concise' 'perl-data-section-simple' 'perl-event' 'perl-file-copy-link' 'perl-file-find-rule' 'perl-file-homedir' 'perl-file-slurp' 'perl-git-repository' 'perl-graph' 'perl-json-xs' 'perl-list-moreutils' 'perl-log-log4perl' 'perl-modern-perl' 'perl-parse-recdescent' 'perl-super' 'perl-term-readline-gnu' 'perl-text-diff' 'perl-text-format' 'perl-text-template' 'perl-try-tiny' 'perl-yaml-tiny' 'perl>=5.10.1')
makedepends=()
url='http://search.mcpan.org/dist/Audio-Nama'
source=('http://search.mcpan.org/CPAN/authors/id/G/GA/GANGLION/Audio-Nama-1.203.tar.gz')
md5sums=('cce549cdc5e8b02de0d1f68885807686')
sha512sums=('d83845303c7a4b17c24421a666b304bc4f34725bf13753b04f2130b5848a64569e1b2e9b74bf5b510fd755706acb8abead1f9562fbeace4b7c5f6c6b0a99dee2')
_distdir="Audio-Nama-1.203"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:

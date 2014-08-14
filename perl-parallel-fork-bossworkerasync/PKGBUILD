# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-parallel-fork-bossworkerasync'
pkgver='0.08'
pkgrel='1'
pkgdesc="Perl extension for creating asynchronous forking queue processing applications."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='http://search.cpan.org/dist/Parallel-Fork-BossWorkerAsync'
source=('http://search.cpan.org/CPAN/authors/id/J/JV/JVANNUCCI/Parallel-Fork-BossWorkerAsync-0.08.tar.gz')
md5sums=('4be9293d7f01a6836f7740da7f76d572')
sha512sums=('eb48b8424d7bf3d4ba3d16881f63e7fef3f06895dcc2d47ba1330a4e857d55340aa34842b08980153a506259a479f59f9f12b99fa38e5ddd13ad921b436b6802')
_distdir="Parallel-Fork-BossWorkerAsync-0.08"

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

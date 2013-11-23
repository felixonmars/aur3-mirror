# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.27

pkgname='perl-git-deploy'
pkgver='6.01'
pkgrel='1'
pkgdesc=""
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='http://search.cpan.org/dist/git-deploy'
source=('http://search.cpan.org/CPAN/authors/id/A/AV/AVAR/git-deploy-6.01.tar.gz')
md5sums=('1132276188e70db56e019e9e94982f76')
sha512sums=('e98203935d03125ce1d7edb931053949f29ad0ff8a0f6b2a398533f5dfcc56945cbe81948537f0f764dce4a271ec785266a967ce00ea8dbee41520f97b6ba1f9')
_distdir="git-deploy-6.01"

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

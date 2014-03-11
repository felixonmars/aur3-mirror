# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-moosex-followpbp'
pkgver='0.05'
pkgrel='1'
pkgdesc="Name your accessors get_foo() and set_foo()"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-moose>=1.16')
makedepends=()
url='http://search.cpan.org/dist/MooseX-FollowPBP'
source=('http://search.cpan.org/CPAN/authors/id/D/DR/DROLSKY/MooseX-FollowPBP-0.05.tar.gz')
md5sums=('6d62fe9be745bba23748290978f89caa')
sha512sums=('40edd8219c6afc032901b3a692fb51aa0867eb5bb91d17fc806cb74a19a034ab11992fbaa8f3b2f711b667abe9cc911f819b1f0b572f152b199e226cf6dcb7f2')
_distdir="MooseX-FollowPBP-0.05"

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

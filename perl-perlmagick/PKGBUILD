# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.27

pkgname='perl-perlmagick'
pkgver='6.87'
pkgrel='8675309'
pkgdesc="Perl bindings for ImageMagick"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'glibc>=2.18' 'imagemagick')
makedepends=()
url='http://search.cpan.org/dist/PerlMagick'
source=('http://search.cpan.org/CPAN/authors/id/J/JC/JCRISTY/PerlMagick-6.87.tar.gz')
md5sums=('c95e602c02b3586acf2441f24c55494b')
sha512sums=('f3cccd14c5cf07eac95f27e47177007c70b331e7f27a2faec555c9d497cc83193a645b9c17304be1b84e3db4a038a9bef86e3ec0101b6d72d1e0957436141ab5')
_distdir="PerlMagick-6.87"

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

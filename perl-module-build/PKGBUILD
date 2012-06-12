# CPAN Name  : Module-Build
# Maintainer : Alan Young <harleypig@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.21
# Repository : http://github.com/harleypig/aur-packages

arch=('any')
depends=('perl>=5.6.1')
license=('PerlArtistic' 'GPL')
makedepends=()
md5sums=('7ef4a7d968cbcd2ab7286b834f885142')
options=('!emptydirs')
pkgdesc="Build, test, and install Perl modules"
pkgname='perl-module-build'
pkgrel='2'
pkgver='0.40'
sha512sums=('ee4a313052444e14f31ae011be7297857b2855ec39b0e8469998f921415c922991032335021551991d919ccc2a90b9f42f25d422f4ed94845a1a2c4251164797')
source=('http://search.cpan.org/CPAN/authors/id/L/LE/LEONT/Module-Build-0.40.tar.gz')
url='http://search.cpan.org/dist/Module-Build'

_distdir="${srcdir}/Module-Build-0.40"

build() {

  export MODULEBUILDRC=/dev/null                                \
         PERL5LIB=""                                            \
         PERL_AUTOINSTALL=--skipdeps                            \
         PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
         PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
         PERL_MM_USE_DEFAULT=1

  cd "$_distdir"

  if [[ -e ./Build.PL ]]; then

    /usr/bin/perl Build.PL
    ./Build

  elif [[ -e ./Makefile.PL ]]; then

    /usr/bin/perl Makefile.PL
    make

  fi

}

check() {

  export MODULEBUILDRC=/dev/null                                \
         PERL5LIB=""                                            \
         PERL_AUTOINSTALL=--skipdeps                            \
         PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
         PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
         PERL_MM_USE_DEFAULT=1

  cd "$_distdir"

  if [[ -e ./Build.PL ]]; then

    ./Build test

  elif [[ -e ./Makefile.PL ]]; then

    make test

  fi

}

package() {

  export MODULEBUILDRC=/dev/null                                \
         PERL5LIB=""                                            \
         PERL_AUTOINSTALL=--skipdeps                            \
         PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
         PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
         PERL_MM_USE_DEFAULT=1

  cd "$_distdir"

  if [[ -e ./Build.PL ]]; then

    ./Build install

  elif [[ -e ./Makefile.PL ]]; then

    make install

  fi

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete

}

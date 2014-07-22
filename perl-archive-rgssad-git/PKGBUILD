# Contributor: Thomas Schneider <maxmusterm@gmail.com>

pkgname=perl-archive-rgssad-git
_gitname=perl-archive-rgssad
pkgver=45.438cf24
pkgrel=1
pkgdesc="Provide an interface to RGSS (ruby game scripting system) archive files."
arch=('any')
url="https://github.com/watashi/perl-archive-rgssad"
license=('GPL')
depends=('perl')
makedepends=('git')
options=('!emptydirs' 'purge')
source=("${_gitname}::git://github.com/watashi/${_gitname}.git")
md5sums=(SKIP)

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() (
  cd "${_gitname}"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  perl Build.PL
  ./Build
)

check() (
  cd "${_gitname}"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  ./Build test
)

package() (

  export MODULEBUILDRC=/dev/null                                \
         PERL5LIB=""                                            \
         PERL_AUTOINSTALL=--skipdeps                            \
         PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
         PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
         PERL_MM_USE_DEFAULT=1

  cd "${_gitname}"
  ./Build install
)

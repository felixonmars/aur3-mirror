# -*- Mode: shell-script; sh-basic-offset: 2 -*-
# Contributor: Justin Davis <jrcd83@gmail.com>
pkgname='perl-cpanplus-dist-arch-git'
pkgver='20121211'
pkgrel='1'
pkgdesc='Developer release for CPANPLUS::Dist::Arch perl module'
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=('perl-test-pod-coverage' 'perl-test-pod')
provides=('perl-cpanplus-dist-arch')
conflicts=('perl-cpanplus-dist-arch')
url='http://github.com/juster/perl-cpanplus-dist-arch'
md5sums=()
source=()

_gitroot='https://github.com/juster/perl-cpanplus-dist-arch.git'
_gitbranch=${BRANCH:-'master'}

build() {
  local DIST_DIR="${srcdir}/${pkgname}" PERL=/usr/bin/perl

  msg 'Creating CPANPLUS::Dist::Arch developer package...'

  if [ -d "$DIST_DIR" ] ; then
    warning 'Repository directory already exists!'
    msg2 'Attempting to pull from repo...'
    cd "$DIST_DIR"
    git pull origin "$_gitbranch"
  else
    msg2 "Cloning $_gitroot repository..."
    git clone "$_gitroot" "$DIST_DIR"
    cd "$DIST_DIR"
  fi

  msg2 "Checking out the $_gitbranch branch..."
  git checkout "$_gitbranch"
  if [ "$?" -ne 0 ] ; then
    error "Failed to checkout the $_gitbranch branch... aborting."
    return 1
  fi

  ( export PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR=$pkgdir"  \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC='/dev/null' RELEASE_TESTING=1

    msg 'Building CPANPLUS::Dist::Arch...'
    cd "$DIST_DIR"
    $PERL Build.PL
    $PERL Build
    msg2 'Testing CPANPLUS::Dist::Arch...'
    $PERL Build test
    $PERL Build install; )

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

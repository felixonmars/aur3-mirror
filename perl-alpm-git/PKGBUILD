# -*- Mode: shell-script; sh-basic-offset: 2 -*-
# Contributor: Justin Davis <jrcd83@gmail.com>
pkgname='perl-alpm-git'
pkgver='20100529'
pkgrel='1'
pkgdesc='Developer release for ALPM perl module'
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
provides=('perl-alpm')
url='http://github.com/juster/perl-alpm'
md5sums=()
source=()

_gitroot='git://github.com/juster/perl-alpm.git'
_gitbranch=${BRANCH:-'master'}

build() {
  DIST_DIR="${srcdir}/${pkgname}"
  msg 'Creating ALPM developer package...'

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

  export PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR=$pkgdir"  \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC='/dev/null' TEST_RELEASE=1

  msg 'Building ALPM...'
  { cd "$DIST_DIR"   &&
    perl Makefile.PL &&
    make             &&
    msg2 'Testing ALPM...' &&
    make test        &&
    make install     ;
  } || return 1;

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

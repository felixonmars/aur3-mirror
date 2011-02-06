# Contributor: Justin Davis <jrcd83@gmail.com>
pkgname='perl-cpanplus-dist-arch-git'
pkgver='20100510'
pkgrel='1'
pkgdesc='Newest developer release for CPANPLUS::Dist::Arch'
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
makedepends=('perl-test-pod-coverage' 'perl-test-pod')
depends=('perl')
provides=('perl-cpanplus-dist-arch')
url='http://github.com/juster/perl-cpanplus-dist-arch'
md5sums=()
source=()

_gitroot='git://github.com/juster/perl-cpanplus-dist-arch.git'
_gitname='master'

build() {
  DIST_DIR="${srcdir}/${pkgname}"
  msg 'Creating CPANPLUS::Dist::Arch developer package...'

  if [ -d "$DIST_DIR" ] ; then
    warning 'Repository directory already exists!'
    msg2 'Attempting to pull from repo and checkout master...'
    cd "$DIST_DIR"
    git pull "$_gitroot" "$_gitname"
    git checkout master
  else
    msg2 "Cloning $_gitroot repository..."
    git clone "$_gitroot" "$DIST_DIR"
  fi

  export PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC='/dev/null' TEST_RELEASE=1

  msg 'Building CPANPLUS::Dist::Arch...'
  { cd "$DIST_DIR"  &&
    perl Build.PL   &&
    perl Build      &&
    msg2 'Testing CPANPLUS::Dist::Arch...' &&
    perl Build test &&
    perl Build install; } || return 1;

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

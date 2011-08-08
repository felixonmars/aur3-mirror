# Maintainer: Magnus Woldrich <trapd00r@trapd00r.se>
pkgname=colorcoke-git
pkgver=20110808
pkgrel=1
pkgdesc="Customize the extended, non-ansi colorset (TERMs supporting > 16 colors)"
arch=('any')
url="http://github.com/trapd00r/colorcoke"
license=('GPLv2')
depends=('perl-term-extendedcolor-xresources')
makedepends=('git')
source=()
md5sums=()

_gitroot="git://github.com/trapd00r/colorcoke.git"
_gitname="colorcoke"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"


  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
  PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
  PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
  MODULEBUILDRC=/dev/null

  {
    perl Makefile.PL &&
    make &&
    make install;
  } || return 1
}

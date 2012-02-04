# Maintainer: Magnus Woldrich <trapd00r@trapd00r.se>
pkgname=pickyfont-git
pkgver=20101027
pkgrel=1
pkgdesc="Change your terminal font in X on the fly, just like setfont in the virtual console"
arch=('any')
url="http://github.com/trapd00r/pickyfont"
license=('GPLv3')
depends=('perl')
makedepends=('git')
source=()
md5sums=()

_gitroot="git://github.com/trapd00r/pickyfont.git"
_gitname="pickyfont"

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

  #mkdir -p $pkgdir/usr/bin

  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  # If using Makefile.PL
  { perl Makefile.PL &&
    make &&
    make install;
  } || return 1
}

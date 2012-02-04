# Maintainer: Magnus Woldrich <trapd00r\@trapd00r.se>
pkgname=rmcd-git
pkgver=20100721
pkgrel=1
pkgdesc="Run mplayer as a daemon and control it remotely"
arch=('any')
url="http://github.com/trapd00r/rmcd"
license=('GPLv3')
depends=('perl-mplayer-nowplaying-git')
makedepends=('git')
source=()
md5sums=()

_gitroot="git://github.com/trapd00r/rmcd.git"
_gitname="rmcd"

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

  mkdir -p $pkgdir/usr/bin

  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  { perl Makefile.PL &&
    make &&
    make install; } || return 1

  install -D -m644 $srcdir/rmcd/rmcd.conf \
    $pkgdir/etc/rmcd.conf



}

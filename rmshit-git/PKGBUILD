# Maintainer Magnus Woldrich <trapd00r\@trapd00r.se>
pkgname=rmshit-git
pkgver=20110122
pkgrel=1
pkgdesc="Keep your home directory (or other dir) clean from unwanted mess"
arch=('any')
url="http://github.com/trapd00r/rmshit"
license=('GPLv3')
depends=('perl' 'perl-linux-inotify2')
makedepends=('git')
backup=(etc/rmshit.conf)
source=()
md5sums=()

_gitroot="git://github.com/trapd00r/rmshit.git"
_gitname="rmshit"

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

  install -D -m644 $srcdir/rmshit/doc/rmshit.conf.example \
    $pkgdir/etc/rmshit.conf
}

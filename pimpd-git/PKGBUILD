# Maintainer: Magnus Woldrich <trapd00r@trapd00r.se>
pkgname=pimpd-git
pkgver=20100921
pkgrel=2
pkgdesc="Perl Interface for the Music Player Daemon (MPD)"
arch=('any')
url="http://github.com/trapd00r/pimpd"
license=('GPLv2')
depends=('perl-audio-mpd')
makedepends=('git')
backup=('etc/pimpd.conf')
source=()
md5sums=()
install="pimpd-git.install"

_gitroot="git://github.com/trapd00r/pimpd.git"
_gitname="pimpd"

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
  
  mkdir -p $pkgdir/{etc,/usr/bin}

  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  {
    perl Makefile.PL &&
      make &&
      make install
  } || return 1

  install -D -m644 pimpd.conf $pkgdir/etc
}

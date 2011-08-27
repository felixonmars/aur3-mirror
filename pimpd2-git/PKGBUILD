# Maintainer: Magnus Woldrich <trapd00r@trapd00r.se>
pkgname='pimpd2-git'
pkgver=20110110
pkgrel=1
pkgdesc="Perl Interface for the Music Player Daemon 2"
arch=('any')
url="http://github.com/trapd00r/pimpd2"
license=('Perl5')

depends=(
  'perl-term-extendedcolor'
  'perl-term-readline-gnu'
  'perl-audio-mpd'
)

makedepends=('git')
backup=('etc/pimpd2.conf')
source=()
md5sums=()

_gitroot="git://github.com/trapd00r/pimpd2.git"
_gitname="pimpd2"

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

  {
    PERL_MM_USE_DEFAULT=1 perl Makefile.PL &&
      make &&
      make test &&
      make install
  }

  install -D -m644 pimpd2.conf $pkgdir/etc
}
